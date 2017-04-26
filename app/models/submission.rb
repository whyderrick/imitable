# frozen_string_literal: true

class Submission < ApplicationRecord
  STATUSES = [
    "Received",
    "In-progress",
    "Declined",
    "Accepted",
    "Completed",
    "Withdrawn",
    "Editable",
  ].freeze

  belongs_to :user
  has_many :submission_packets, dependent: :destroy
  has_many :poems, through: :submission_packets

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: SUBMISSION_STATUSES }
  validates :submitted_to, presence: true
end
