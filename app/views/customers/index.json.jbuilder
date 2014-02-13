json.array!(@customers) do |customer|
  json.extract! customer, :id, :cell
  json.url customer_url(customer, format: :json)
end
