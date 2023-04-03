class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :pool, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
