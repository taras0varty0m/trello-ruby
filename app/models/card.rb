# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :column

  validates :title, :column_id, :description, :user_id, presence: true

  has_many :comments
end
