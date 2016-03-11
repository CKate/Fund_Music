class AddTotaldonationToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :total_donation, :decimal
  end
end
