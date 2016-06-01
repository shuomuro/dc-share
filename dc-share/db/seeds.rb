# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

# 金融機関CSVアップロード用
# CSV.foreach('db/seed_security.csv') do |row|
#   Security.create(:security_code => row[0], :name => row[1], :group => row[2])
# end

# 商品CSVアップロード用
# CSV.foreach('db/seed_product.csv') do |row|
#   Product.create(:product_code => row[0], :name => row[1])
# end

# LineupsCSVアップロード用
# CSV.foreach('db/seed_lineup.csv') do |row|
#   Lineup.create(:security_id => row[0], :product_id => row[1])
# end
