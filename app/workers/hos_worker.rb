require 'handler'
require 'hos_handler'

hardware_id = params[:hardware_id]
lat = params[:lat]
lng = params[:lng]
time = params[:time]
event_code = params[:event_code]
distance_traveled = params[:distance_traveled]

HosHandler.new.post hardware_id,lat,lng,time,event_code,distance_traveled