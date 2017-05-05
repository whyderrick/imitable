class User < ApplicationRecord
  include Clearance::User

  has_many :poems, dependent: :destroy
  has_many :submissions
end
