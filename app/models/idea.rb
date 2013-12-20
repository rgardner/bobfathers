class Idea < ActiveRecord::Base
  before_save { suggested_by.downcase! }
  before_create :create_status
  before_create { self.event_url  = "" }
  before_create { self.event_info = "" }
  VALID_EMAIL_REGEX = /\A.{3}\d{3}@nyu.edu\z/i
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :suggested_by, presence: true,
                           format: { with: VALID_EMAIL_REGEX }

  STATUSES = { denied: "DENIED", pending: "PENDING", approved: "APPROVED" }

  self.per_page = 10

  def send_verification_token
    generate_token(:verification_token)
    save!
    UserMailer.verification_email(self).deliver
  end

  private

    def create_status
      self.status = STATUSES[:pending]
    end

    def generate_token(column)
      self[column] = SecureRandom.urlsafe_base64
    end
end
