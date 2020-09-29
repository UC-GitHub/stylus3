class Style < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to_active_hash :season
  belongs_to_active_hash :age
  belongs_to_active_hash :height
  belongs_to_active_hash :body_figure
  belongs_to_active_hash :shipping_date

  VALID_PRICE_REGEX = /\A[-]?[0-9]+(\.[0-9]+)?\z/
  
  validates :image, :name, :description, :tops1_price, :bottoms1_price, :total_price, presence: true
  validates :type_id, :season_id, :age_id, :height_id, :body_figure_id, :shipping_date_id, numericality: { other_than: 1, message: 'must be Selected' }

  has_one :order
  belongs_to :supplier
  has_one_attached :image
end
