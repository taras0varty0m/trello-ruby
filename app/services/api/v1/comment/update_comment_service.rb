# frozen_string_literal: true

module Api
  module V1
    module Comment
      class UpdateCommentService < ApplicationService
        def initialize(id, text)
          @id = id
          @text = text
        end

        def call
          @comment = ::Comment.find @id

          @comment.update(text: @text)
        end
      end
    end
  end
end
