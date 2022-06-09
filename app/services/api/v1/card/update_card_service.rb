# frozen_string_literal: true

module Api
  module V1
    module Card
      class UpdateCardService < ApplicationService
        def initialize(id, title, description, user_id)
          @id = id
          @title = title
          @description = description
          @user_id = user_id
        end

        def call
          prev_card = ::Card.find_by title: @title
          raise StandardError, "Card with title '#{@title}' already exists" if prev_card.present?

          @card = ::Card.find @id
          @column = ::Column.where({ id: @card.column_id }).select(:user_id).take

          if @card.user_id != @user_id || @column.user_id != @user_id
            raise StandardError,
                  'You don\'t have permission to update this card'
          end

          @card.update(title: @title, description: @description)
        end
      end
    end
  end
end
