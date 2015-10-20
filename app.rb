require "sinatra"
require "active_support/all"
require 'frisky/ssdp'
require_relative "lib/wemo"

get "/" do
	erb :index
end

post "/wemos/:uuid/:state" do
	wemo = Wemo::Switch.find(params[:uuid])
	wemo.set! params[:state]
	status 200
end

helpers do
	def wemos
		Wemo::Radar.new('urn:Belkin:service:basicevent:1').scan
	end
end
