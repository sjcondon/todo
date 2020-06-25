class TodoList < ActiveRecord::Base
    has_many :todo_items
    has_many :users, through: :todo_items
    belongs_to :creator, class_name: :User, foreign_key: :creator_id
    scope :ordered_by_title, -> { order(title: :asc) }
end

