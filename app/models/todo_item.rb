class TodoItem < ActiveRecord::Base
    belongs_to :todo_list
    belongs_to :user, optional: true
    

  
  def completed?
    !self.completed_at.blank?
   end
  end
