json.extract! contact, :id, :nome, :email, :kind_id, :remarkable, :created_at, :updated_at
json.url contact_url(contact, format: :json)
