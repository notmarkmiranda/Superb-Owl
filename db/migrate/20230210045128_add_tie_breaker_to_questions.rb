class AddTieBreakerToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :tiebreaker, :boolean, default: false
  end
end
