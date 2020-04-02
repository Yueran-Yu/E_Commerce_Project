json.extract! page, :id, :title, :content, :permaink, :created_at, :updated_at
json.url page_url(page, format: :json)
