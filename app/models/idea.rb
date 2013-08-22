class Idea < ActiveRecord::Base
  before_create :create_status
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :suggested_by, presence: true

  STATUSES = { denied: "DENIED", pending: "PENDING", approved: "APPROVED" }

  private

    def create_status
      self.status = STATUSES[:pending]
    end
end
