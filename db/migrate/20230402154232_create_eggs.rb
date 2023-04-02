class CreateEggs < ActiveRecord::Migration[6.1]
  def change
    create_table :eggs do |t|
      t.string :title
      t.string :game
      t.integer :diffRating
      t.text :guide

      t.timestamps
    end
  end
end
