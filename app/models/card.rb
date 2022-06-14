# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :column

  validates :column_id, :description, :user_id, presence: true
  validates :title, uniqueness: true, presence: true

  has_many :comments
end
