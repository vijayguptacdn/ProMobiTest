class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.integer :assign_user_id
      t.integer :status_type_id
      t.belongs_to :project
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
