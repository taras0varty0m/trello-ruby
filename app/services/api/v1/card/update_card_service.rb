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
          prev_card = ::Card.find_by title: @title
          raise StandardError, "Card with title '#{@title}' already exists" if prev_card.present?

          @card = ::Card.find @id

          @card.update(title: @title, description: @description)
        end
      end
    end
  end
end
