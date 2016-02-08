class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :latest_single
      t.string :photo
      t.string :genre
      t.decimal :minimum_donation

      t.timestamps
    end
  end
end
