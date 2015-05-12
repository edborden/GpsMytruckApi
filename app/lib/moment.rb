class Moment

	def initialize moment
		@moment = moment
	end
	
	def to_ruby
		# format: 2015-04-30T19:15:07.884Z
		array = @moment.split "-"
		year = array[0].to_i
		month = array[1].to_i
		array = array[2].split "T"
		day = array[0].to_i
		array = array[1].split ":"
		hour = array[0].to_i
		minute = array[1].to_i
		Time.new year,month,day,hour,minute,nil,0
	end

end