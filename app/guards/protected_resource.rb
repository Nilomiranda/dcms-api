class ProtectedResource
  def self.ensure_authenticated(context)
    raise GraphQL::ExecutionError.new('Unauthorized', options: { status: :unauthorized, code: 401 }) unless context[:current_user]
  end
end
