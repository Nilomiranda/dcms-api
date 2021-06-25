require "graphql/rake_task"
require "rake"

GraphQL::RakeTask.new(
  load_schema: -> (_task) {
    puts "LOADING SCHEMA"
    require_relative '../../app/graphql/dcms_schema'
    DcmsSchema
  }
)

namespace :graphql do
  task export: :environment do
    Rake::Task["graphql:schema:dump"].invoke
  end
end
