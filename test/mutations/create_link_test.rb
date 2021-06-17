require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new link' do
    link_entry = perform(url: 'http://test.com', description: 'A link to test')

    link = link_entry[:link]

    assert link.persisted?
    assert_equal link.description, 'A link to test'
    assert_equal link.url, 'http://test.com'
  end
end
