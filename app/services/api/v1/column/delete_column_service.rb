# frozen_string_literal: true

module Api
  module V1
    module Column
      class DeleteColumnService < ApplicationService
        def initialize(id, user_id)
          @id = id
          @user_id = user_id
        end

        def call
          @column = ::Column.find @id
          raise StandardError, 'You don\'t have permission to delete this column' if @column.user_id != @user_id

          @column.destroy
        end
      end
    end
  end
end
