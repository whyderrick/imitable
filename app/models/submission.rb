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

  accepts_nested_attributes_for :submission_packets,
    reject_if: :deep_blank?

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :submitted_to, presence: true

  def build_poem(attributes = {})
    submission_packets.build.build_poem(attributes)
  end

  # Could use benchmarking against other strategies like using `all`
  # If I decide I want to make this private, the way to do that is to factor
  # this logic away into and object and make the `Submission#deep_blank?` pass
  # attributes an instance of it.
  def deep_blank?(attributes)
    if attributes.blank?
      true
    elsif attributes.respond_to?(:values)
      attributes.reject { |_key, value| deep_blank?(value) }.empty?
    else
      false
    end
  end
end
