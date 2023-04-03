class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: false
      t.boolean :locked, default: false
      t.integer :game, null: false
      t.boolean :finalized, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
