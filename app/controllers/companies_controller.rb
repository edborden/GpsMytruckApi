class CompaniesController < ResourceController

  def report

    Company.all.each do |company|

      if company.daily_report

        today = Time.now
        subject = "#{today.month}/#{today.day}/#{today.year} Daily Mileage Report"

        startTime = Time.now - 1.day
        endTime = Time.now

        body = "#{company.name} mileage from #{startTime} to #{endTime}\r\n\r\n"

        company.devices.each do |device|

          locations = device.locations.where(time: startTime..endTime).order :time
          mileage = TotalMileageReport.new(locations).run

          body += "#{device.name}: #{mileage}mi\r\n\r\n"

        end

        MailHandler.new.handle :daily_report, company, subject, body

      end

    end

    head :no_content

  end

	def resource_params
		params.require(:company).permit :name,:user_id,:towbook,:audit,:email,:daily_report
	end

end