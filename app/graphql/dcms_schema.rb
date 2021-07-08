class DcmsSchema < GraphQL::Schema

  rescue_from ActiveRecord::ActiveRecordError do | err, obj, args, ctx, field |
    raise GraphQL::ExecutionError, err
  end

  mutation(Types::MutationType)
  query(Types::QueryType)
end
