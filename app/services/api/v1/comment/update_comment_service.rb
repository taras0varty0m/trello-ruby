# frozen_string_literal: true

module Api
  module V1
    module Comment
      class UpdateCommentService < ApplicationService
        attr_reader :id, :text, :user_id

        def initialize(id, text, user_id)
          @id = id
          @text = text
          @user_id = user_id
        end

        def call
          prev_comment = ::Comment.find_by text: @text
          raise StandardError, "Comment with text '#{@text}' already exists" if prev_comment.present?

          @comment = ::Comment.find @id

          raise StandardError, 'You don\'t have permission to update this comment' if @comment.user_id != @user_id

          @comment.update(text: @text)
        end
      end
    end
  end
end
