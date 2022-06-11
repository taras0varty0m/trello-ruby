# frozen_string_literal: true

module Api
  module V1
    module Card
      class UpdateCardService < ApplicationService
        def initialize(id, title, description)
          @id = id
          @title = title
          @description = description
        end

        def call
          @card = ::Card.find @id

          @card.update(title: @title, description: @description)
        end
      end
    end
  end
end
