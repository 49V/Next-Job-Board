class Candidate < ApplicationRecord
  belongs_to :user
  validates :bio, :portfolio, :role, presence: true
end
