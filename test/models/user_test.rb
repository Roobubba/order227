require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
  def setup
    @user = User.new(username: "testuser", email: "Blah@blah.blah", password: "1234")
    
  end
   
   
  test "user should be valid" do
    assert @user.valid?
  end
  
  test "username must be present" do
    @user.username = ""
    assert_not @user.valid?
  end
  
  test "username must be min 5 characters" do
    @user.username = "a" * 4 
    assert_not @user.valid?
  end
  
  test "username must be max 25 characters" do
    @user.username = "a" * 26
    assert_not @user.valid?
  end
  
  test "password cannot be blank" do
    newuser = User.new(username: "testuser", email: "Blah@blah.blah", password: "")
    assert_respond_to @user, :password_digest
    assert_respond_to @user, :authenticate, "User requires has_secure_password"
    assert_not newuser.save, "Saved user without password"
  end
  
  test "email length max length 105" do
    @user.email = "a" * 106
    assert_not @user.valid?
  end
  
  test "email must be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@blah.hello.org user@example.com first.last@boo.eu laura+joe@funkymonkey.uk]
    valid_addresses.each do |va|
      @user.email = va
      assert @user.valid?, '#{va.inspect} should be valid'
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@eee,com R_TDD-DS-at-blah.hello.org user@example. first.last@boo_hoo_.eu laurajoe@funky+monkey.uk]
    invalid_addresses.each do |inva|
      @user.email = inva
      assert_not @user.valid?, '#{inva.inspect} should be invalid'
    end
  end

end