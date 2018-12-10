class Job < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :title, :company, :link, :role, presence: true
  validates :notes, length: { maximum: 500}
end
