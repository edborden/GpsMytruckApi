User.create email:"jim",password:"pass"
Company.create name:"TestCo",audit:true,towbook:true,user_id:1
Device.create hardware_id:"testId12345",company_id:1
50.times do 
	Location.create lat:"44.780772",lng:"-75.634928",time:"2015-04-08T20:28:01.000+0000",device_id:1
end