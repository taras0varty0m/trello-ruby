# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      include ActionController::RequestForgeryProtection
      protect_from_forgery with: :exception
      skip_before_action :verify_authenticity_token
    end
  end
end
