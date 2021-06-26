module Types
  class AllowedWebsiteType < Types::BaseObject
    field :id, ID, null: false
    field :domain, String, null: false
  end
end
