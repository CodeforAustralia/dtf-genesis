
def email_contract_start(contract, email_address)
  puts "Email contract starting: #{contract.vt_title}"
  ApplicationMailer.announce_email(contract, email_address).deliver
end

def email_contract_end(contract, email_address)
  puts "Email contract ending: #{contract.vt_title}"
  ApplicationMailer.announce_email(contract, email_address).deliver
end
