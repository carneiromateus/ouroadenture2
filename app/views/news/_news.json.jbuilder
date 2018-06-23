json.extract! news, :id, :title, :link, :description, :user_id, :subtitle, :short_description, :created_at, :updated_at
json.url news_url(news, format: :json)
