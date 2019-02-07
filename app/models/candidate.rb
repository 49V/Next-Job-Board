class Candidate < ApplicationRecord
  belongs_to :user
  validates :looking_for, :location, :role, presence: true
end
