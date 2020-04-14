class CreateTodoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_items do |t|
      t.string :content
      t.references :todo_list, index: true
      t.references :user, index: true
      t.datetime :completed
      t.datetime :completed_at

      t.timestamps

    end
  end
end
