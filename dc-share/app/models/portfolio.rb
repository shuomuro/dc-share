class Portfolio < ActiveRecord::Base

#  validates :name, presence: true
#  validates :user_id, presence: true
#  validates :security_id, presence: true

  has_many :constituents, foreign_key: "portfolio_id"
  has_many :products, through: :contituents

  belongs_to :securities, foreign_key: "security_id"

  belongs_to :users ,foreign_key: "user_id"

  has_many :likes, foreign_key: "portfolio_id"
  has_many :users, through: :likes

#モデルの階層関連付け
#ポートフォリオ作成フォームで商品追加・削除可能にするためallow_destroy: trueを追加
  accepts_nested_attributes_for :constituents, allow_destroy: true

end
