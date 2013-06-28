json.array!(@posts) do |post|
  json.extract! post, :title, :text, :tags, :user_id
  json.url post_url(post, format: :json)
end
