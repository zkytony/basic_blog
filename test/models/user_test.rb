require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user_tony = User.new(email: "tonybu@example.com", password: "123qwesa")
    @user_boni = User.new(email: "bonisa@example.com", password: "12355")    
  end

  test "should be valid" do
    assert @user_tony.valid?
  end

  test "should not be valid" do
    assert !@user_boni.valid?
  end

  test "email format error" do
    # this change of email will be reverted after this test function
    @user_tony.email = "not valid email"
    assert !@user_tony.valid?
  end

  test "email is unique" do
    copy = @user_tony.dup
    assert @user_tony.valid?
    @user_tony.save
    assert !copy.valid?
  end

end
