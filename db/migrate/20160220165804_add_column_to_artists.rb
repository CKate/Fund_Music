class AddColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :target_amount, :decimal
    add_column :artists, :met_target, :boolean
    add_column :artists, :target_date, :datetime
  end
end
