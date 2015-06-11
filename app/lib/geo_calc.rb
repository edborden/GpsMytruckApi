module GeoCalc

	DEGREE_TO_RADIAN = 0.01745327
	R = 6371 # radius of earth

	# Equirectangular approximation good enough http://www.movable-type.co.uk/scripts/latlong.html
	def GeoCalc.distance(lat1,lng1,lat2,lng2)
		φ1 = lat1 * DEGREE_TO_RADIAN
		λ1 = lng1 * DEGREE_TO_RADIAN
		φ2 = lat2 * DEGREE_TO_RADIAN
		λ2 = lng2 * DEGREE_TO_RADIAN
		x = (λ2-λ1) * Math.cos((φ1+φ2)/2)
		y = (φ2-φ1)
		d = Math.sqrt(x*x + y*y) * R * 1000
	end

	def GeoCalc.km_to_m(km)
		km * 0.621371
	end

end