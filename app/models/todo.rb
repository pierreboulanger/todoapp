class Todo < ActiveRecord::Base

  validates :title, presence: true
  validates :title, length: { in: 3..140 }
end
