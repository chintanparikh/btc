require "curb"

module ApplicationHelper
	def get_current_rate
		json = JSON.parse(Curl.get("https://coinbase.com/api/v1/currencies/exchange_rates").body)
		json["btc_to_usd"].to_f
	end
end
