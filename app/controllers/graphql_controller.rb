# app/controllers/graphql_controller.rb
class GraphqlController < ApplicationController
  def execute
    result = CompaignhubSchema.execute(
      params[:query],
      variables: ensure_hash(params[:variables]),
      context: { current_user: current_user }, # You can provide additional context here if needed
      operation_name: params[:operationName]
    )
    render json: result
  end

  private

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
