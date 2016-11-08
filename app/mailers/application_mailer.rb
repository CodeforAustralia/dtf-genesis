class ApplicationMailer < ActionMailer::Base
  default from: 'benjamin@codeforaustralia.org'

  def announce_email(contract, email)
    puts "mailer CON:#{contract}"
    @contract = contract
    mail(to: email, subject: "Sample email")
  end
end
