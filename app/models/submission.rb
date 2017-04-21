class Submission < ApplicationRecord
  SUBMISSION_STATUSES = [
    "Received",
    "In-progress",
    "Declined",
    "Accepted",
    "Completed",
    "Withdrawn",
    "Editable",
  ]
  belongs_to :user
  has_many :submission_packets, dependent: :destroy
  has_many :poems, through: :submission_packets

  validates_presence_of :title 
  validates :status, presence: true, inclusion: { in: SUBMISSION_STATUSES }
  validates_presence_of :submitted_to
end
