module Mutations
  require_relative '../../guards/protected_resource'

  class DeleteUserPost < BaseMutation
    argument :id, String, required: true

    field :success, Boolean, null: false

    def resolve(id: nil)
      ProtectedResource.ensure_authenticated context

      post = Post.find_by(id: id, user_id: context[:current_user][:id])

      raise GraphQL::ExecutionError.new 'Post not found', options: { status: :not_found, code: 404 } if post.nil?

      post.destroy

      { success: true }
    end
  end
end
