class CreateConstituents < ActiveRecord::Migration
  def change
    create_table :constituents do |t|
      t.references :portfolio, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :percent

      t.timestamps null: false
    end
  end
end
