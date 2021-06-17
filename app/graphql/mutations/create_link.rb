module Mutations
  class CreateLink < BaseMutation
    argument :description, String, required: true
    argument :url, String, required: true

    field :link, Types::LinkType, null: false

    def resolve(description: nil, url: nil)
      link = Link.create!(description: description, url: url)
      { link: link }
    end
  end
end
