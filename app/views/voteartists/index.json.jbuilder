json.array!(@voteartists) do |voteartist|
  json.extract! voteartist, :id, :artist_id, :user_id, :integer, :country_id, :amount_paid
  json.url voteartist_url(voteartist, format: :json)
end
