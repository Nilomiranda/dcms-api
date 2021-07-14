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

      raise GraphQL::ExecutionError.new('Either email or password is wrong', options: { status: :unauthorized, code: 401 }) if check_password(user, credentials[:password]).nil?

      token_payload = { user_id: user[:id], exp: Time.now.to_i + 1.week }
      token = JWT.encode token_payload, nil, 'none'

      context[:cookies][:token] = token

      { user: user, token: token }
    end

    def check_password(user, password)
      return nil unless user.authenticate(password)

      true
    end
  end
end
