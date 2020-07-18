class ApplicationMailer < ActionMailer::Base
  default from: 'nobody@codeforaustralia.org'

  def announce_email(contract, email)
    puts "mailer CON:#{contract}"
    @contract = contract
    mail(to: email, subject: "Sample email", body: "not much yet")
  end
end
