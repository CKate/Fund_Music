class CreateVoteartists < ActiveRecord::Migration
  def change
    create_table :voteartists do |t|
      t.integer :artist_id
      t.integer :user_id
      t.integer :country_id
      t.decimal :amount_paid

      t.timestamps null: false
    end
  end
end
