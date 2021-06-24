module Mutations
  require_relative '../../guards/protected_resource'

  class UpdateUserPost < BaseMutation
    argument :id, String, required: true
    argument :post_data, Types::UserPostUpdateInput, required: true

    field :user_post, Types::PostType, null: false

    def resolve(id: nil, post_data: nil)
      ProtectedResource.ensure_authenticated(context)

      post = Post.find_by(id: id, user_id: context[:current_user][:id])

      raise GraphQL::ExecutionError.new 'Post not found', options: { status: :not_found, code: 404 } if post.nil?

      post.title = post_data[:title] unless post_data[:title].nil?
      post.content = post_data[:content] unless post_data[:content].nil?
      post.published = post_data[:published] unless post_data[:published].nil?

      post.save

      { user_post: Post.find_by(id: id, user_id: context[:current_user][:id]) }
    end
  end
end
