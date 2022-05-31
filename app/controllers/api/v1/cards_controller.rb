# frozen_string_literal: true

module Api
  module V1
    class CardsController < AuthenticationController
      before_action :authenticate_api_v1_user!, except: %i[index show]

      def index
        cards = ::Card.all
        render json: { cards: cards }, status: :ok
      end

      def show
        card = ::Card.find params[:id]
        render json: { card: card }, status: :ok
      end

      def create
        ActiveRecord::Base.transaction do
          card = Api::V1::Card::CreateCardService.new(
            params[:title],
            params[:description],
            params[:column_id],
            current_api_v1_user.id
          ).call
          render json: { card: card }
        end
      rescue StandardError => e
        render json: { error: e }
      end
    end
  end
end
