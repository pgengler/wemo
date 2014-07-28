require "sinatra"
require "active_support/all"
require 'playful/ssdp'
require_relative "lib/wemo"

class DeviceList
	def initialize
		scan_for_devices
	end

	def devices
		@wemos
	end

	def scan_for_devices
		@wemos = Wemo::Radar.new('urn:Belkin:service:basicevent:1').scan
	end
end

$device_list = DeviceList.new

get "/" do
	erb :index
end

post "/" do
	$device_list.scan_for_devices
	redirect to('/')
end

post "/wemos/:uuid/:state" do
	wemo = Wemo::Switch.find(params[:uuid])
	wemo.set! params[:state]
	status 200
end

helpers do
	def wemos
		$device_list.devices
	end
end
