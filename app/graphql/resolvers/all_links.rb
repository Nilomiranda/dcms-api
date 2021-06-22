module Resolvers
  class AllLinks < Resolvers::Base
    type [Types::LinkType], null: false

    def resolve
      raise GraphQL::ExecutionError.new('Unauthorized', options: { status: :unauthorized, code: 401 }) unless context[:current_user]
      Link.all
    end
  end
end
