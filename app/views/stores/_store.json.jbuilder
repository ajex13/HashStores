json.extract! store, :id, :name, :street, :city, :zip, :phone, :website, :created_at, :updated_at
json.url store_url(store, format: :json)
