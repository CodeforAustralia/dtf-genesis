# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# ContactPerson.create([
#   {name: "Testy McTestings", phone: "0419 390 496", fax: "(03) 9845 9876", email: "some@lame.address"}
#   ])

LocationCode.create!([
  { code: 'BUS', description: 'Business Address'},
  { code: 'XTR', description: 'Extra Address'},
  { code: 'BRN', description: 'Branch Office Address'},
  { code: 'REG', description: 'Registered Address'},
  { code: 'OTH', description: 'Other Address'}
  ])

ContractValueType.create([
  {type_description: "Estimate", type_shortname: "est"},
  {type_description: "Fixed Price", type_shortname: "fix"}
  ])


# historic data... 5 years
# $100000 -> $500000000
# 34 per month
# 408 per year
# ~2000 records
# 365 * 7 = 2555



# 2000.times do |record|
#   duration = Faker::Number.between(80, 2000)
#   first_year = Faker::Number.between(10,14)
#   start = Date.parse("20#{first_year}-#{Faker::Number.between(1, 12)}-#{Faker::Number.between(1, 28)}")
#   finish = start + duration
#   location = Faker::Address.street_address
#   Contract.create({
#     vt_contract_number: Faker::Company.duns_number,
#     department_index: 0,
#     status: "Expired",
#     title: "#{Faker::Company.buzzword}, #{Faker::Company.catch_phrase} at #{location}",
#     start_date: start,
#     end_date: finish,
#     total_value: duration * Faker::Number.between(1000, 200000),
#     contract_type_index: 0,
#     value_type_index: 0,
#     status_index: 0,
#     unspc_code: 30000000,
#     contract_description: Faker::Lorem.sentence,
#     department_id: Faker::Number.between(0, 19),
#     supplier_id: 0,
#     contact_id: 0,
#     contract_type_id: 0,
#     unspsc_id: 0,
#     project_id: 0,
#     address: location,
#     status_id: 0
#     })
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
