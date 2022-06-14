# frozen_string_literal: true

class Column < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, uniqueness: true, presence: true

  has_many :cards
end
