require 'iron_worker'
require 'handler'
require 'towbook_handler'
require 'httparty'

payload = IronWorker.payload

hardware_id = payload[:hardware_id]
lat = payload[:lat]
lng = payload[:lng]
time = payload[:time]

TowbookHandler.new.post hardware_id,lat,lng,time