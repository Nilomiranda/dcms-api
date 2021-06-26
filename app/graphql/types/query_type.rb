module Types
  require_relative '../../guards/protected_resource'

  class QueryType < BaseObject
    add_field GraphQL::Types::Relay::NodeField
    add_field GraphQL::Types::Relay::NodesField

    field :posts, Types::PostType.connection_type, null: false, max_page_size: 20
    def posts
      ProtectedResource.ensure_authenticated context

      Post.where(user_id: context[:current_user][:id])
    end

    field :user, Types::UserType, { null: false }
    def user
      ProtectedResource.ensure_authenticated context

      context[:current_user]
    end

    field :allowed_websites, Types::AllowedWebsiteType.connection_type, null: false, max_page_size: 20
    def allowed_websites
      ProtectedResource.ensure_authenticated context

      AllowedWebsite.where(user_id: context[:current_user][:id])
    end
  end
end
