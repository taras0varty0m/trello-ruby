# frozen_string_literal: true

module Api
  module V1
    module Comment
      class CreateCommentService < ApplicationService
        def initialize(text, card_id, user_id)
          @text = text
          @card_id = card_id
          @user_id = user_id
        end

        def call
          ::Comment.create(text: @text, card_id: @card_id, user_id: @user_id)
        end
      end
    end
  end
end
