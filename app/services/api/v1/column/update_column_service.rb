# frozen_string_literal: true

module Api
  module V1
    module Column
      class UpdateColumnService < ApplicationService
        attr_reader :id, :title, :user_id

        def initialize(id, title, user_id)
          @id = id
          @title = title
          @user_id = user_id
        end

        def call
          prev_column = ::Column.find_by title: @title
          raise StandardError, "Column with title '#{@title}' already exists" if prev_column.present?

          @column = ::Column.find @id
          raise StandardError, 'You don\'t have permission to update this column' if @column.user_id != @user_id

          @column.update(title: @title)
        end
      end
    end
  end
end
