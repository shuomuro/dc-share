class Constituent < ActiveRecord::Base

  belongs_to :portfolios, foreign_key: "portfolio_id"

  belongs_to :products, foreign_key: "product_id"

end
