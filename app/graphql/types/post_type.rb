module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :published, Boolean, null: false
    field :content, String, null: false
  end
end
