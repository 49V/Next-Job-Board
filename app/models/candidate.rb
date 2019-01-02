class Candidate < ApplicationRecord
  belongs_to :user
  validates :user_id, :portfolio, :role, presence: true
  validates :bio, length: { maximum: 1000 }
end
