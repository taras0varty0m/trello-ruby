# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :text, presence: true
end
