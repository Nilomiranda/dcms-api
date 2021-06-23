module Types
  require_relative '../../guards/protected_resource'

  class QueryType < BaseObject
    add_field GraphQL::Types::Relay::NodeField
    add_field GraphQL::Types::Relay::NodesField

    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, resolver: Resolvers::AllLinks

    field :posts, Types::PostType.connection_type, null: false, max_page_size: 20
    def posts
      ProtectedResource.ensure_authenticated context

      Post.where(user_id: context[:current_user][:id])
    end
  end
end
