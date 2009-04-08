class Notebook < ActiveRecord::Base

  belongs_to :creator, :class_name => "User"

  has_many :annoters

  has_many :users, :through => :annoters

  has_many :readers, :through => :annoters, :source => :user, :conditions => "status = 'READER' "
  has_many :writers, :through => :annoters, :source => :user, :conditions => "status = 'WRITER' "

  has_many  :notes

  validates_presence_of :name, :creator_id

  def after_create
    # create the notebook_user entry
    self.writers << self.creator
  end
  
  def display
    self.notes.find(:all, :order => "rank DESC ").collect{ |n| n.display }.join
  end

end
