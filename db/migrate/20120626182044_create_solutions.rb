class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.string :state

      t.timestamps
    end
  end
end
