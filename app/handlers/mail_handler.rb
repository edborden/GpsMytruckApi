class MailHandler < MandrillMailer::MessageMailer
  include Handler
  
  default from: "support@gpsmytruck.com"
  default from_name: "GPSMyTruck"

  def daily_report company, subject, body
    mandrill_mail( subject: subject,
      text: body,
      to: {email: company.email, name: company.name},
      important: true,
      async: true
    ).deliver
  end

end