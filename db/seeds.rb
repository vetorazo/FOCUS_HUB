# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing the database..."
Len.destroy_all

puts "Creating 20 lens..."

lens = [
  {
    brand: "Canon",
    model: "RF100-500mm F4.5-7.1 L IS USM",
    description: [
      'High Performance L-series versatile Super-Telephoto Zoom RF Lens',
      'Optical Image Stabilization with up to 5 Stops* of Shake Correction',
      'Three Image Stabilization Modes (Standard, Panning, and during exposure only) for Creative Versatility'
    ]
  },
  {
    brand: "Canon",
    model: "RF24-70mm F2.8 L IS USM",
    description: [
      'High Image Quality and Bright f/2.8 Aperture Standard Zoom RF L Lens',
      'Optical Image Stabilization of up to 5 Stops* of Shake Correction',
      'High Speed, Smooth and Quiet Auto Focus with Nano USM'
    ]
  },
  {
    brand: "Canon",
    model: "RF200-800mm F6.3-9 IS USM",
    description: [
      'Powerful zoom range from 200mm through 800mm',
      'Compatible with Extender RF1.4x and Extender RF2x, at all focal lengths',
      'Comfortable handheld shooting and amazing mobility'
    ]
  },
  {
    brand: "Canon",
    model: "RF24-105mm F2.8 L IS USM Z",
    description: [
      "World's first 24-105mm focal length combined with consistent f/2.8 maximum aperture",
      'Supports optional Canon Power Zoom Adapters',
      '11 aperture blades'
    ]
  },
  {
    brand: "Sony",
    model: "E 15mm F1.4 G APS-C Large-aperture Wide-angle G Lens",
    description: [
      'Spectacular rendering and bokeh in a wide-angle F1.4 G Lens',
      'Eye-opening G Lens resolution and contrast from full aperture',
      'Breathtaking, naturally rendered bokeh at wide F1.4 aperture'
    ]
  },
  {
    brand: "Sony",
    model: "FE 400-800mm f/6.3-8 G OSS",
    description: [
      'The first Alpha series super-telephoto zoom lens to cover the 400 to 800 mm range',
      'High resolution and natural bokeh throughout the zoom range',
      'Internal zoom for stable handling'
    ]
  },
  {
    brand: "Sony",
    model: "FE 50mm F2.5 G Full-frame Standard Prime G Lens",
    description: [
      'Ultra-compact fast prime w/ G series lens quality and performance',
      'F2.5 max aperture for low-light and shallow depth of field',
      'Two Aspherical elements for corner-to-corner sharpness'
    ]
  },
  {
    brand: "Sony",
    model: "FE 12-24mm F2.8 GM Full-frame Ultra-wide Zoom G Master Lens",
    description: [
      "World's widest full-frame constant F2.8 at 12-24mm3",
      'F2.8 max aperture provides extraordinary exposure and depth of field',
      'Spectacular resolution: 3x Extreme Aspheric elements, 1x Aspheric'
    ]
  },
  {
    brand: "Nikon",
    model: "NIKKOR Z DX 12-28mm f/3.5-5.6 PZ VR",
    description: [
      'Create beautiful immersive content with the widest APS-C size/DX format zoom lens for Z series cameras',
      "Record sharp, image-stabilized video from arm's length, remotely zoom in and out to get exactly the right shot",
      'Small, lightweight, virtually silent and so versatile'
    ]
  },
  {
    brand: "Nikon",
    model: "NIKKOR Z 14-24mm f/2.8 S",
    description: [
      'Ultra-wide perspectives that challenge our sense of scale',
      'Constant aperture zoom available for high clarity and details',
      'Optimized for landscapes, cityscapes, night skies, architecture, interiors and environmental portraits'
    ]
  },
  {
    brand: "Nikon",
    model: "AF-S NIKKOR 180-400mm f/4E TC1.4 FL ED VR",
    description: [
      'Capture sports, events and wildlife in lifelike brilliance from 180-400mm',
      'Without breaking shooting posture, engage the integrated teleconverter and increase your reach to 560mm f/5.6',
      'Incorporating remarkable advancements in optical design, autofocus performance'
    ]
  },
  {
    brand: "Nikon",
    model: "AF-S NIKKOR 70-200mm f/2.8G ED VR II",
    description: [
      'Beautifully capture bright, razor-sharp images and HD videos',
      'Quick and responsive autofocus, super steady Vibration Reduction, accurate color rendition, contrast and gorgeous bokeh',
      "f/2.8 fixed maximum aperture and Nikon's advanced lens technologies"
    ]
  },
  {
    brand: "Fujifilm",
    model: "XC 35mm f/2",
    description: [
      'Fast f/2 Aperture: Excellent low-light performance',
      '35mm Focal Length: Versatile standard lens choice',
      'Fujifilm X Mount: Designed for X Series mirrorless',
      'Compact, Lightweight: Ideal for travel photography',
      'Smooth Autofocus: Capture sharp, clear images'
    ]
  },
  {
    brand: "Fujifilm",
    model: "XF 16-55mm f/2.8 R LM WR II",
    description: [
      'XF 16-55mm Lens: Exceptional Image Quality',
      'Constant f/2.8 Aperture: Stunning Bokeh Effects',
      'Fast Autofocus: Capture Sharp, Clear Images',
      'Weather-Resistant Build: For Outdoor Shooting',
      '16-55mm Focal Length: Versatile Zoom Range'
    ]
  },
  {
    brand: "Fujifilm",
    model: "GF 45mm f/2.8 R WR",
    description: [
      'Fujifilm GF 45mm: Exceptional Image Quality',
      'Capture sharp details with this prime lens',
      'F2.8 Aperture: Stunning bokeh & low light',
      'Medium Format Lens: Superior build quality',
      '45mm Focal Length: Natural perspective shots'
    ]
  },
  {
    brand: "Fujifilm",
    model: "GF 100-200mm f/5.6 R LM OIS WR",
    description: [
      'GF 100-200mm Lens: Exceptional Image Quality',
      'Capture stunning detail with Fujifilm Sharpness',
      'Versatile 100-200mm Focal Length for portraits',
      'Maximum f/5.6 Aperture for great depth control',
      'Robust Build Quality ensures lasting durability'
    ]
  },
  {
    brand: "Panasonic",
    model: "LUMIX S 28-200mm f/4-7.1 MACRO O.I.S. Lens for L Mount",
    description: [
      'Versatile 28-200mm focal length zoom lens',
      'Achieve sharp images with O.I.S. stabilization',
      'Compact build quality, ideal for travel photos',
      'Fast, accurate autofocus for stills and video',
      'Macro capability; get as close as 5.5 inches'
    ]
  },
  {
    brand: "Panasonic",
    model: "Leica DG Vario-Elmarit 100-400mm f/4.0-6.3 II ASPH Lens for MFT",
    description: [
      'Achieve stunning clarity with premium image quality',
      '100-400mm focal length excels in telephoto photography',
      'POWER O.I.S. ensures stabilized, sharp images',
      'Micro Four Thirds mount offers versatile compatibility',
      'f/4-6.3 aperture range for varied lighting conditions'
    ]
  },
  {
    brand: "Panasonic",
    model: "LUMIX S PRO 70-200mm f/2.8 Lens for L Mount",
    description: [
      'Achieve stunning clarity with this Panasonic lens',
      'Fast f/2.8 aperture excels in low light conditions',
      '70-200mm focal length ideal for versatile shooting',
      'L-Mount lens ensures compatibility with Lumix cameras',
      'Optical Image Stabilization delivers sharp images'
    ]
  },
  {
    brand: "Panasonic",
    model: "Leica DG Vario-Elmarit 35-100mm f/2.8 Lens",
    description: [
      'Capture sharp images with POWER O.I.S. stabilization',
      'Experience smooth bokeh with a circular aperture',
      'Panasonic Leica 35-100mm lens ensures top image quality',
      'Micro Four Thirds mount offers versatile compatibility',
      'Rugged build: dust/splash-resistant mirrorless lens'
    ]
  }
]

lens.each do |len|
  Len.create!(len)
end

puts "Finished creating lens!"

puts "Creating sample users..."
User.destroy_all
users = [
  { email: "brunob@example.com", password: "password", first_name: "Bruno", last_name: "Vetorazo", user_name: "bruno_vetorazo", address: "123 Main St, Anytown, USA" },
  { email: "phuong@example.com", password: "password", first_name: "Phuong", last_name: "Mai", user_name: "phuong_mai", address: "456 Elm St, Anytown, USA" },
  { email: "hannah@example.com", password: "password", first_name: "Hannah", last_name: "Lapasaran", user_name: "hannah_lapasaran", address: "789 Oak St, Anytown, USA" }
]
users = users.map { |attrs| User.create!(attrs) }

puts "Creating sample listings..."

# Get some lens and users
all_lens = Len.all
all_users = User.all

# Example listings
Listing.destroy_all
Listing.create!(
  user: all_users[0],
  len: all_lens.sample,
  daily_rate: 250,
  owner_description: "Well maintained, perfect for wildlife photography."
)
Listing.create!(
  user: all_users[1],
  len: all_lens.sample,
  daily_rate: 185,
  owner_description: "Lightly used, comes with a carrying case."
)
Listing.create!(
  user: all_users[2],
  len: all_lens.sample,
  daily_rate: 300,
  owner_description: "Top condition, ideal for portraits and events."
)

puts "Finished creating listings!"