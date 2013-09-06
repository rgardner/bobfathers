class Message
  include ActiveAttr::Model
  
  attribute :name,    type: String
  attribute :email,   type: String
  attribute :subject, type: String
  attribute :content, type: String

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name,    presence: true, length: { maximum: 50 }
  validates :email,   presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true
  validates :content, presence: true, length: { minimum: 30 }

end