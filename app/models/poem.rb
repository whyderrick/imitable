# frozen_string_literal: true

class Poem < ApplicationRecord
  STATUSES = [
    "Rough Draft",
    "Ready",
    "Submitted",
    "Accepted",
    "Published",
  ].freeze

  belongs_to :user
  has_many :submission_packets, dependent: :destroy
  has_many :submissions, through: :submission_packets

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
