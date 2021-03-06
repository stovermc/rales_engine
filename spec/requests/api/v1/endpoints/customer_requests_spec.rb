require 'rails_helper'

describe "customer API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'
    expect(response).to be_success
    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq id
  end
end
