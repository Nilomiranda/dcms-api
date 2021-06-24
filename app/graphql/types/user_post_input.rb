module Types
  class UserPostInput < BaseInputObject
    graphql_name 'USER_POST_INPUT'

    argument :title, String, required: true
    argument :content, String, required: true
    argument :published, Boolean, required: false
  end

  class UserPostUpdateInput < BaseInputObject
    graphql_name 'USER_POST_UPDATE_INPUT'

    argument :title, String, required: false
    argument :content, String, required: false
    argument :published, Boolean, required: false
  end
end
