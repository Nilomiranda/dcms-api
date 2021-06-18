require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user_entry = perform(
      name: 'Test user',
      auth_provider: {
        credentials: {
          email: 'email@test.com',
          password: '[omitted]',
        }
      }
    )

    user = user_entry[:user]

    assert user.persisted?
    assert_equal user.name, 'Test user'
    assert_equal user.email, 'email@test.com'
  end
end
