class Annoter < ActiveRecord::Base
  
  belongs_to :notebook
  belongs_to :user
  
end
