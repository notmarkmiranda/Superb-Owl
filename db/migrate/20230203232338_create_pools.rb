class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.boolean :active, default: true
      t.datetime :lock
      t.datetime :finalize
      t.boolean :multiple_entries, default: false

      t.timestamps
    end
  end
end
