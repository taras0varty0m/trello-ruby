# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.references :column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
