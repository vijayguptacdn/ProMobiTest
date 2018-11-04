class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :assign_user , class_name: "User"
  belongs_to :status_type, :optional => true 

  after_create :set_status

  private
   def set_status
   	 self.status_type_id = 3
   	 self.save!
   end
end
