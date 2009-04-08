class Note < ActiveRecord::Base
  
  belongs_to  :notebook
  
  validates_presence_of :notebook_id

  def display
    "<div class='note' id='note_#{self.id}'><h3>#{self.name}</h3> #{self.content}</div>"
  end

  def before_create
    if self.notebook.notes.length > 0
      self.rank = self.notebook.notes.maximum(:rank) + 1
    else
      self.rank = 0
    end
  end
  
end

