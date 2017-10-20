class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews

  validates :name, :description, :price, :image, presence: true

  def price_in_dollars
    price_in_dollars = price.to_f
    sprintf("$%.2f", price_in_dollars)
  end

end
