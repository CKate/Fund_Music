json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :latest_single, :photo, :genre, :minimum_donation
  json.url artist_url(artist, format: :json)
end
