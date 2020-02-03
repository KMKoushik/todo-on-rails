require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    assert_not user.save
  end

  test 'should able to save user' do
    user = User.new
    user.email = 'test@test.com'
    user.password = 'password'
    assert user.save
  end

  test 'should not able to save user with same mail' do
    user = User.new
    user.email = 'test@test.com'
    user.password = 'password'
    assert user.save

    user2 = User.new
    user2.email = 'test@test.com'
    user2.password = 'password'
    assert_not user2.save
  end
end
