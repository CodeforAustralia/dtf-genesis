json.extract! contract_status, :id, :name, :short_name, :created_at, :updated_at
json.url contract_status_url(contract_status, format: :json)