# frozen_string_literal: true

module Api
  module V1
    module Column
      class CreateColumnService < ApplicationService
        def initialize(title, user_id)
          @title = title
          @user_id = user_id
        end

        def call
          ::Column.create!(title: @title, user_id: @user_id)
        end
      end
    end
  end
end
