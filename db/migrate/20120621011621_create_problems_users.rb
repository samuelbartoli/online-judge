class CreateProblemsUsers < ActiveRecord::Migration
  def up
    create_table :problems_users, :id => false do |t|
      t.integer :problem_id
      t.integer :user_id
      t.string  :estado
    end
  end

  def down
    drop_table :problems_users
  end
end
