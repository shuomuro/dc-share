class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :security_code
      t.string :name
      t.string :group

      t.timestamps null: false
    end
  end
end
