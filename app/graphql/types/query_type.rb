module Types
  class QueryType < BaseObject
    add_field GraphQL::Types::Relay::NodeField
    add_field GraphQL::Types::Relay::NodesField

    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, resolver: Resolvers::AllLinks
  end
end
