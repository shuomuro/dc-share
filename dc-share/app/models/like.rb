class Like < ActiveRecord::Base

  belongs_to :users, foreign_key: "user_id"

  belongs_to :portfolios, foreign_key: "portfolio_id"

end
