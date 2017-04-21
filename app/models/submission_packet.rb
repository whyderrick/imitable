class SubmissionPacket < ApplicationRecord
  belongs_to :poem
  belongs_to :submission
end
