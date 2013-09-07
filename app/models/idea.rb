class Idea < ActiveRecord::Base
  before_save { suggested_by.downcase! }
  before_create :create_status
  VALID_EMAIL_REGEX = /\A.{3}\d{3}@nyu.edu\z/i
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :suggested_by, presence: true,
                           format: { with: VALID_EMAIL_REGEX }

  STATUSES = { denied: "DENIED", pending: "PENDING", approved: "APPROVED" }

  private

    def create_status
      self.status = STATUSES[:pending]
    end
end
