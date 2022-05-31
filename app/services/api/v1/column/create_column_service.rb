# frozen_string_literal: true

module Api
  module V1
    module Column
      class CreateColumnService < ApplicationService
        attr_reader :title, :user_id

        def initialize(title, user_id)
          @title = title
          @user_id = user_id
        end

        def call
          prev_column = ::Column.find_by title: @title
          raise StandardError, 'Column already exists' if prev_column.present?

          ::Column.create(title: @title, user_id: @user_id)
        end
      end
    end
  end
end
