# frozen_string_literal: true

module Api
  module V1
    module Column
      class DeleteColumnService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @column = ::Column.find @id

          @column.destroy
        end
      end
    end
  end
end
