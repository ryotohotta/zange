json.array!(@cheers) do |cheer|
  json.extract! cheer, :id, :user_id, :article_id
  json.url cheer_url(cheer, format: :json)
end
