class AddPublicToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :public_pool, :boolean, default: false
  end
end
