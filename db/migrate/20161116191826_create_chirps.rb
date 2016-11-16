class CreateChirps < ActiveRecord::Migration[5.0]
  def change
    create_table :chirps do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
