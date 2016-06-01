class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.references :security, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps null: false
    end
  end
end
