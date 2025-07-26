# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
require "nokogiri"

puts "Clearing the database..."
Lens.destroy_all

puts "Creating 48 lenses..."

# Open a brand page
# Select the first 10 td
# On each td, grab the title in the <a> tag for model name + img URL
# Get show page url of each td
# Go to the show page and grab the lens details for description

# Open the photo, attach the image and save/upload

# Safety operator
brands = ["canon", "fuji", "nikon", "sony", "tamron"]

brands.each do |brand|
  url = "https://photographylife.com/lenses/brand/#{brand}"

  html_file = URI.parse(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  html_doc.search(".lensdb td").slice(0,10).each do |element|
    model = element.children.first.children.first.attribute_nodes.second.value.strip
    showpage_url = element.children.first.children.first.attribute_nodes.first.value.strip
    img_url = element.children[1].children.first.attribute_nodes[2].value.strip

    showpage_file = URI.parse(showpage_url).read
    showpage_doc = Nokogiri::HTML.parse(showpage_file)

    description_element = showpage_doc.search(".db_details p")[1]&.children
    next if description_element.nil?

    description = description_element[1]&.text&.strip

    # & safe navigation operator

    file = URI.parse(img_url).open
    lens = Lens.new(brand: brand.capitalize, model: model, description: description)
    lens.photo.attach(io: file, filename: "#{model}.jpg", content_type: "image/jpg")
    lens.save
  end
end



puts "Finished creating lens!"

puts "Creating sample users..."
User.destroy_all
users = [
  { email: "bruno@example.com", password: "password", first_name: "Bruno", last_name: "Vetorazo", user_name: "bruno_vetorazo", address: "123 Main St, Anytown, Japan" },
  { email: "phuong@example.com", password: "password", first_name: "Phuong", last_name: "Mai", user_name: "phuong_mai", address: "456 Elm St, Anytown, Japan" },
  { email: "hannah@example.com", password: "password", first_name: "Hannah", last_name: "Lapasaran", user_name: "hannah_lapasaran", address: "789 Oak St, Anytown, Japan" },
  { email: "takatomo@example.com", password: "password", first_name: "Homma", last_name: "Takatomo", user_name: "takatomo_homma", address: "101 Pine St, Anytown, Japan" }
]
users = users.map { |attrs| User.create!(attrs) }

puts "Creating sample listings..."

# Get lens and users
all_lenses = Lens.all
all_users = User.all
# owner_description = [
#   "Well maintained, perfect for wildlife photography.",
#   "Lightly used, comes with a carrying case.",
#   "Top condition, ideal for portraits and events.",
#   "Perfect for landscape and wildlife photography.",
#   "Used for 3 years but still functions very well.",
#   "Was used to take Michael Jackson's portraits."
#   "Marilyn Monroe blew a kiss to this lens back in the day."
# ]
# Example listings
Listing.destroy_all

Lens.all.each do |lens|
  Listing.create!(
    user: all_users[0],
    lens: lens,
    daily_rate: 2500,
    owner_description: "Top condition, ideal for portraits and events. Marilyn Monroe blew a kiss to this lens back in the day."
  )
  Listing.create!(
    user: all_users[1],
    lens: lens,
    daily_rate: 1850,
    owner_description: "Lightly used, comes with a carrying case. Used for 3 years but still functions very well."
  )
  Listing.create!(
    user: all_users[2],
    lens: lens,
    daily_rate: 3000,
    owner_description: "Top condition, ideal for portraits and events. Was used to take Michael Jackson's portraits."
  )
  Listing.create!(
    user: all_users[3],
    lens: lens,
    daily_rate: 2200,
    owner_description: "Perfect for landscape and wildlife photography."
  )
end

# Listing.create!(
#   user: all_users[0],
#   lens: all_lenses.sample,
#   daily_rate: 2500,
#   owner_description: "Well maintained, perfect for wildlife photography."
# )
# Listing.create!(
#   user: all_users[1],
#   lens: all_lenses.sample,
#   daily_rate: 1850,
#   owner_description: "Lightly used, comes with a carrying case."
# )
# Listing.create!(
#   user: all_users[2],
#   lens: all_lenses.sample,
#   daily_rate: 3000,
#   owner_description: "Top condition, ideal for portraits and events."
# )
# Listing.create!(
#   user: all_users[3],
#   lens: all_lenses.sample,
#   daily_rate: 2200,
#   owner_description: "Perfect for landscape and wildlife photography."
# )

puts "Finished creating listings!"
