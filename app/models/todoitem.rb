class Todoitem < ApplicationRecord
  belongs_to :task
  validates :todo, presence: true
end
