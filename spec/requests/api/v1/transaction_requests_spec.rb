require 'rails_helper'

describe "transaction API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'
    expect(response).to be_success
    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)
    expect(transaction["id"]).to eq id
  end
end
