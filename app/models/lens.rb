class Lens < ApplicationRecord
  include PgSearch::Model
  
  has_many :listings, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true, uniqueness: { scope: :brand }
  attribute :description, :string

  has_one_attached :photo

    pg_search_scope :search_by_brand_model_or_description,
    against: [ :brand, :model, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
