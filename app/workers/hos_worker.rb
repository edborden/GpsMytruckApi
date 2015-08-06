require 'iron_worker'
require 'handler'
require 'hos_handler'

payload = IronWorker.payload

hardware_id = payload[:hardware_id]
lat = payload[:lat]
lng = payload[:lng]
time = payload[:time]
event_code = payload[:event_code]
distance_traveled = payload[:distance_traveled]

HosHandler.new.post hardware_id,lat,lng,time,event_code,distance_traveled