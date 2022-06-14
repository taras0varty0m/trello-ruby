# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :user_id, :card_id, presence: true
  validates :text, uniqueness: true, presence: true
end
