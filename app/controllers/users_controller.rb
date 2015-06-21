class UsersController < ApplicationController

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 50 }

  validates :password, presence: true,
                       length: { minimum: 8 }


  def index

  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
