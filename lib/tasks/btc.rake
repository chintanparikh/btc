require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :btc do
  desc "TODO"
  task trade: :environment do
  	current_rate = get_current_rate

  	User.all.each do |user|
  		puts "Current rate: #{current_rate}"
  		puts "Last rate: #{user.last_rate}"
  		if user.needs_to_buy? and (current_rate < user.last_rate)
  			user.btc = user.usd / current_rate
  			puts "Bought #{user.btc} for #{user.usd}"
  			user.usd = 0
  		elsif user.needs_to_sell? and (current_rate > user.last_rate)
  			user.usd = user.btc * current_rate
  			puts "Sold #{user.btc} for #{user.usd}"
  			user.btc = 0
  		else
  			puts "Did nothing"
  		end
  		user.last_rate = current_rate
  		user.save
  	end
  end

end
