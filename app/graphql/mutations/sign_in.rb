module Mutations
  class SignIn < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :error, String, null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by email: credentials[:email]

      return unless user
      return {
        error: 'Wrong credentials'
      } if check_password(user, credentials[:password]).nil?

      token_payload = { user_id: user[:id], exp: Time.now.to_i + 1.week }
      token = JWT.encode token_payload, nil, 'none'

      { user: user, token: token }
    end

    def check_password(user, password)
      return nil unless user.authenticate(password)

      true
    end
  end
end
