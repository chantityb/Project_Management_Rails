class Task < ApplicationRecord
  belongs_to :project

  def completed?
  	#refer to if statement in task partial file. 
  	#says that if task is completed column should not be blank
  	!completed_at.blank?
  end
end
