# frozen_string_literal: true

module Api
  module V1
    module Comment
      class DeleteCommentService < ApplicationService
        def initialize(id, user_id)
          @id = id
          @user_id = user_id
        end

        def call
          @comment = ::Comment.find @id
          raise StandardError, 'You don\'t have permission to delete this comment' if @comment.user_id != @user_id

          @comment.destroy
        end
      end
    end
  end
end
