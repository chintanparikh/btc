class User < ActiveRecord::Base

	def needs_to_sell?
		usd == 0
	end

	def needs_to_buy?
		btc == 0
	end
end
