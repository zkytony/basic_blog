class User < ActiveRecord::Base
  has_many :blogs, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,    presence: true, 
                       uniqueness: { case_sensitive: false },
                       format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, 
                       length: { minimum: 8 }


end

