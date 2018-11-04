class Project < ApplicationRecord
  belongs_to :user

  has_many :contributors, dependent: :destroy
  has_many :users, through: :contributors

  has_many :todos,  dependent: :destroy
  accepts_nested_attributes_for :contributors, :allow_destroy => true


  def get_chart_data 
  	data = []
  	todo = ['todo status', 'Todo status count']
  	data << todo
  	todos = self.todos.group_by {|a| a.status_type.try(:name)}
  	todos.each do |status, records|
  		todo_data = []
  		todo_data << status
  		todo_data << records.count
  		data << todo_data
  	end
  	data
  end
end
