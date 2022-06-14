# frozen_string_literal: true

module Api
  module V1
    module Card
      class DeleteCardService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @card = ::Card.find @id

          @card.destroy!
        end
      end
    end
  end
end
