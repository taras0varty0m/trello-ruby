# frozen_string_literal: true

module Api
  module V1
    class CardsController < AuthenticationController
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: ::Card.all
      end

      def show
        card = ::Card.find params[:id]
        render json: card
      end

      def create
        ActiveRecord::Base.transaction do
          card = Api::V1::Card::CreateCardService.new(
            params[:title],
            params[:description],
            params[:column_id],
            current_user.id
          ).call
          render json: { card: card }
        end
      rescue StandardError => e
        render json: { error: e }
      end

      def update
        Api::V1::Card::UpdateCardService.new(
          params[:id],
          params[:title],
          params[:description]
        ).call
        render json: { message: 'Card successfully updated'}
      rescue StandardError => e
        render json: { error: e }, status: 403
      end

      def destroy
        Api::V1::Card::DeleteCardService.new(params[:id]).call
        render json: { message: 'Card successfully deleted'}
      rescue StandardError => e
        render json: { error: e }, status: 403
      end
    end
  end
end
