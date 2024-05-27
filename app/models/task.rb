class Task < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  enum :task_type, %i[vacation day_off]
  enum :status, %i[pending approve unapprove]
end
