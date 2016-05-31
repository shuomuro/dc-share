class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :security, foreign_key: true
      t.string :unique_constituent
      t.string :purpose

      t.timestamps null: false
    end
  end
end
