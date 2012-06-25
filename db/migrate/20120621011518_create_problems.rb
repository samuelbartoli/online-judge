class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
  end

end
