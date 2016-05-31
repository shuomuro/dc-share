class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_name
      t.string :email
      t.string :password_digest
      t.string :job
      t.string :location
      t.string :year
      t.string :month
      t.string :day

      t.timestamps null: false
      t.index :email, unique: true
      t.index :account_name, unique: true
    end
  end
end
