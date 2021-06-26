module Types
  class MutationType < Types::BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in, mutation: Mutations::SignIn
    field :create_user_post, mutation: Mutations::CreateUserPost
    field :delete_user_post, mutation: Mutations::DeleteUserPost
    field :update_user_post, mutation: Mutations::UpdateUserPost
    field :create_allowed_website, mutation: Mutations::CreateAllowedWebsite
  end
end
