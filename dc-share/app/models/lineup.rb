class Lineup < ActiveRecord::Base

  belongs_to :products, foreign_key: "product_id"

  belongs_to :securities, foreign_key: "security_id"

end
