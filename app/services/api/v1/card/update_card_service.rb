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

          @card.title = @title if @title.present?
          @card.description = @description if @description.present?

          @card.save!
        end
      end
    end
  end
end
