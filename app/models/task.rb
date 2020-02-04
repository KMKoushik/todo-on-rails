class Task < ApplicationRecord
  belongs_to :user
  has_many :todoitems
  validates :name, presence: true
end
