class Currency < ApplicationRecord
    def calculate_value(amount)
        (current_price.to_f * amount.to_f).round(4)
    
    end


    def current_price
        url = 'https://api.coinmarketcap.com/v1/ticker/'
        # url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?PRO_API_KEY=48e961af-b28f-402e-b44a-8b67300dbbd8'
        request = HTTParty.get(url + self.slug)
        response = JSON.parse(request.body)[0]["price_usd"]
    end
end
