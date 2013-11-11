json.array!(@news) do |news|
  json.extract! news, 
  json.url news_url(news, format: :json)
end
