class Lens < ApplicationRecord
  has_many :listings, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true, uniqueness: { scope: :brand }
  attribute :description, :string, array: true
end
