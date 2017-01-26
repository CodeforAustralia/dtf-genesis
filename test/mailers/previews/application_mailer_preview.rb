
class ApplicationMailerPreview < ActionMailer::Preview

  def application_mailer_preview
    contract = Contract.create(vt_contract_number: "34756",
                                vt_department_id: "CON-001",
                                vt_status_id: 0,
                                vt_title: "example title",
                                vt_start_date: Date.parse("11/10/1979"),
                                vt_end_date: Date.parse("16/10/1979"),
                                vt_total_value: 1000000 )
    ApplicationMailer.announce_email(contract, "nobody@gmail.com")
  end
end
