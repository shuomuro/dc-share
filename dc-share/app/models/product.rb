class Product < ActiveRecord::Base
  validates :product_code, presence: true
  validates :name, presence: true

  has_many :lineups, foreign_key: "product_id"
  has_many :securities, through: :lineups

  has_many :contituents, foreign_key: "product_id"
  has_many :portfolios, through: :contituents
end
