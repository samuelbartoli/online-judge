class AddAttachToProblems < ActiveRecord::Migration
  def self.up
    add_attachment :problems, :test
  end

  def self.down
    remove_attachment :problems, :test
  end
end
