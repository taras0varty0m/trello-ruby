# frozen_string_literal: true

module Api
  module V1
    module Card
      class CreateCardService < ApplicationService
        def initialize(title, description, column_id, user_id)
          @title = title
          @description = description
          @column_id = column_id
          @user_id = user_id
        end

        def call
          ::Card.create!(title: @title, description: @description, column_id: @column_id,
                        user_id: @user_id)
        end
      end
    end
  end
end
