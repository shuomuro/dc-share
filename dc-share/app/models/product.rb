class Product < ActiveRecord::Base
  validates :code, presence: true
  validates :name, presence: true

  has_many :lineups, foreign_key: "product_id"
  belongs_to :securies, through: :lineups
  
  has_many :contituents, foreign_key: "product_id"
  has_many :portfolios, through: :contituents
end
