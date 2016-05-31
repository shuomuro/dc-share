class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :account_name, presence: true, length: { maximum: 50 }
  validates :job, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 10 }
  validates :year, presence: true, length: { is: 4 }
  validates :month, presence: true, length: { is: 2 }
  validates :day, presence: true, length: { is: 2 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :portfolios, foreign_key: "user_id"

  has_many :likes, foreign_key: "user_id"
  has_many :portfolios, through: :likes
  
end
