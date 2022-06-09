# frozen_string_literal: true

module Api
  module V1
    module Column
      class UpdateColumnService < ApplicationService
        def initialize(id, title)
          @id = id
          @title = title
        end

        def call
          prev_column = ::Column.find_by title: @title
          raise StandardError, "Column with title '#{@title}' already exists" if prev_column.present?

          @column = ::Column.find @id

          @column.update(title: @title)
        end
      end
    end
  end
end
