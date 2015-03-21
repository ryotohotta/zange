json.array!(@completions) do |completion|
  json.extract! completion, :id, :article_id
  json.url completion_url(completion, format: :json)
end
