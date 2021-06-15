class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_e59678df96e044d2acd06e8857b52310',
      secret_token: 'Tsk_da4e6b5cd1ef4a1084c3a75608934344',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
  end
end
