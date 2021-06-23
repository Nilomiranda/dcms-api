module Mutations
  require_relative '../../guards/protected_resource'

  class CreateUserPost < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :published, Boolean, required: false

    field :user_post, Types::PostType, null: false

    def resolve(title: nil, content: nil, published: nil)
      ProtectedResource.ensure_authenticated(context)

      user_post = Post.create!(title: title, content: content, published: published, user_id: context[:current_user][:id])

      { user_post: user_post }
    end
  end
end
