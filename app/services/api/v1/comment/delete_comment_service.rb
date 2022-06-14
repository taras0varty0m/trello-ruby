# frozen_string_literal: true

module Api
  module V1
    module Comment
      class DeleteCommentService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @comment = ::Comment.find @id

          @comment.destroy!
        end
      end
    end
  end
end
