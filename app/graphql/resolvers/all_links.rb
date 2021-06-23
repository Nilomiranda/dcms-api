module Resolvers
  class AllLinks < Resolvers::Base
    type [Types::LinkType], null: false

    def resolve

      Link.all
    end
  end
end
