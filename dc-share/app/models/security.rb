class Security < ActiveRecord::Base
  validates :security_code, presence: true
  validates :name, presence: true
  
  has_many :lineups, foreign_key: "security_id"
  has_many :products, through: :lineups
end
