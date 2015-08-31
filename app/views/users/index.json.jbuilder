json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :address, :phone, :website, :company
  json.url user_url(user, format: :json)
end
