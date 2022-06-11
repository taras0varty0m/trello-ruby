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
          @column = ::Column.find @id

          @column.update(title: @title)
        end
      end
    end
  end
end
