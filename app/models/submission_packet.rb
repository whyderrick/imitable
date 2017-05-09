class SubmissionPacket < ApplicationRecord
  belongs_to :poem
  belongs_to :submission

  accepts_nested_attributes_for :poem
end
