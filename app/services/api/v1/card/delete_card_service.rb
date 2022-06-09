# frozen_string_literal: true

module Api
  module V1
    module Card
      class DeleteCardService < ApplicationService
        def initialize(id, user_id)
          @id = id
          @user_id = user_id
        end

        def call
          @card = ::Card.find @id
          raise StandardError, 'You don\'t have permission to delete this card' if @card.user_id != @user_id

          @card.destroy
        end
      end
    end
  end
end
