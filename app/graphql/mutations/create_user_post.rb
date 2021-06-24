module Mutations
  require_relative '../../guards/protected_resource'

  class CreateUserPost < BaseMutation
    argument :post_data, Types::UserPostInput, required: true

    field :user_post, Types::PostType, null: false

    def resolve(post_data: nil)
      ProtectedResource.ensure_authenticated(context)

      user_post = Post.create!(
        title: post_data[:title],
        content: post_data[:title],
        published: post_data[:published],
        user_id: context[:current_user][:id]
      )

      { user_post: user_post }
    end
  end
end
