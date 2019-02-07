class Job < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :title, :company, :link, :role, :location, presence: true
  validates :elevator_pitch, :why_get_excited, :description, length: { maximum: 500}
end
