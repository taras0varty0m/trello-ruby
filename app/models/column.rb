# frozen_string_literal: true

class Column < ApplicationRecord
  belongs_to :user

  validates :title, :user_id, presence: true

  has_many :cards
end
