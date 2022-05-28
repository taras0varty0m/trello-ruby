class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.string :title
      t.string :string
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
