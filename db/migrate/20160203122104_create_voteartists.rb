class CreateVoteartists < ActiveRecord::Migration
  def change
    create_table :voteartists do |t|
      t.integer :artist_id
      t.string :user_id
      t.string :integer
      t.integer :country_id
      t.decimal :amount_paid

      t.timestamps
    end
  end
end
