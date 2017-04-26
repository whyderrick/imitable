# frozen_string_literal: true

class Poem < ApplicationRecord
  POEM_STATUSES = ["Rough Draft", "Ready", "Submitted", "Accepted", "Published"]
  belongs_to :user
  has_many :submission_packets, dependent: :destroy
  has_many :submissions, through: :submission_packets

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: POEM_STATUSES }
end 
