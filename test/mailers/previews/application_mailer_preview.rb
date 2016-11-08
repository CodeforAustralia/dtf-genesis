
class ApplicationMailerPreview < ActionMailer::Preview

  def application_mailer_preview
    contract = Contract.create(vt_contract_number: "34756",
                                department_index: "CON-001",
                                status: "testing",
                                title: "example title",
                                start_date: Date.parse("11/10/1979"),
                                end_date: Date.parse("16/10/1979"),
                                total_value: 1000000 )
    puts "prev CON:#{contract}"
    ApplicationMailer.announce_email(contract, "puzzleduck@gmail.com")
  end
end
