class Problem < ActiveRecord::Base
  attr_accessible :code, :description, :name, :test
  validates :code, :presence => true, :length => {:minimum => 5, :maximum => 5}
  validates :name, :presence => true
  validates :description, :presence => true
  validates_uniqueness_of :code, :name
  has_attached_file :test,
    :path => ":rails_root/public/data/:id_:basename.:extension"

  #validates_attachment_content_type :test, :content_type => 'application/x-ruby', :message => "The test problem file type is invalid. It must be a ruby application."

  has_many :solutions
  has_many :users, :through => :solutions

  validate :check_content_type

  def check_content_type
   if !'text/plain'.include?(self.test_content_type)
    errors.add(:test, "file type is invalid. It must be a text file.") # or errors.add
   end
  end

end
