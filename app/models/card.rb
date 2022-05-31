# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  belongs_to :column

  validates :title, presence: true
  validates :description, presence: true

  has_many :comments
end
