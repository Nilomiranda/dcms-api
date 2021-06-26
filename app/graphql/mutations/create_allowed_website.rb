module Mutations
  class CreateAllowedWebsite < BaseMutation
    argument :domain, String, required: true

    field :allowed_website, Types::AllowedWebsiteType, null: false

    def resolve(domain: nil)
      allowed_website = AllowedWebsite.create!(domain: domain, user_id: context[:current_user][:id])

      { allowed_website: allowed_website }
    end
  end
end
