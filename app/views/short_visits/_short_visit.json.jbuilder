json.extract! short_visit, :id, :short_url_id, :visitor_ip, :visitor_city, :visitior_state, :visitor_country_iso, :latitude, :longitude, :created_at, :updated_at
json.url short_visit_url(short_visit, format: :json)