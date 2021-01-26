# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Knock::Authenticable
  skip_before_action :verify_authenticity_token

  private

  def render_errors(errors, status = :unprocessable_entity)
    render json: { errors: errors }, status: status
  end
end
