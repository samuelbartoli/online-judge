class Solution < ActiveRecord::Base
  attr_accessible :problem_id, :state, :user_id

  has_many :users
  has_many :problems

  scope :for_user, lambda {|user_id| {:conditions => {:user_id => user_id}}}
end
