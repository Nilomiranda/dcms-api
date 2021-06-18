module Mutations
  class SignIn < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by email: credentials[:email]

      return unless user
      return unless user.authenticate(credentials[:password])

      token_payload = { user_id: user[:id] }
      token = JWT.encode token_payload, nil, 'none'

      puts("token", token)

      { user: user, token: token }
    end
  end
end
