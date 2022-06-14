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

          @column.title = @title if @title.present?

          @column.save!
        end
      end
    end
  end
end
