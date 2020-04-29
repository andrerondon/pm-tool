class AddTasksToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :tasks, foreign_key: true
  end
end
