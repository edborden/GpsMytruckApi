require "iron_worker"

class IronWorkerHandler 
	include Handler

	def initialize
		@token = "TL5uy6QPZ-dUfCy4kq1HYzmNoZM"
		@project_id = "55c36d913c8e0a000a000054"
	end

	def client
		@client ||= IronWorker::Client.new token:@token,project_id:@project_id
	end

	def task task_name, params_obj
		client.tasks.create task_name, params_obj
	end

end