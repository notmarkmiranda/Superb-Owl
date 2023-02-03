class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :confirmation_code
      t.datetime :confirmation_expiration

      t.timestamps
    end
  end
end
