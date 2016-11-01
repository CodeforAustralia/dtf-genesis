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


Department.create!([
  { name: "CenITex", short_name: "CTX", vt_number: 5154 },
  { name: "Department of Economic Development, Jobs, Transport and Resources", short_name: "DEDJTR", vt_number: 43087 },
  { name: "Department of Education and Training", short_name: "DET", vt_number: 42999 },
  { name: "Department of Environment and Primary Industries", short_name: "DEPI", vt_number: 43 },
  { name: "Department of Environment, Land, Water and Planning", short_name: "DELWP", vt_number: 42924 },
  { name: "Department of Health & Human Services", short_name: "DHHS", vt_number: 42963 },
  { name: "Department of Health & Human Services - Property & Asset Services", short_name: "DHHS-PAS", vt_number: 43494 },
  { name: "Department of Justice & Regulation", short_name: "DJR", vt_number: 43004 },
  { name: "Department of Premier and Cabinet", short_name: "DPC", vt_number: 10 },
  { name: "Independent Broad-based Anti-corruption Commission", short_name: "ACC", vt_number: 42425 },
  { name: "Infrastructure Victoria", short_name: "IV", vt_number: 52488 },
  { name: "Major Projects Victoria", short_name: "MPV", vt_number: 20135 },
  { name: "Metropolitan Fire and Emergency Services Board", short_name: "MFB", vt_number: 3161 },
  { name: "State Revenue Office", short_name: "SRO", vt_number: 15 },
  { name: "Victoria Police", short_name: "VicPol", vt_number: 39 },
  { name: "Victorian Auditor General's Office", short_name: "VicAG", vt_number: 5979 },
  { name: "Victorian Commission for Gambling and Liquor Regulation", short_name: "LAB", vt_number: 33602 },
  { name: "Whole of Victorian Government", short_name: "WoVG", vt_number: 18641 },
  { name: "WoVG Land Sales", short_name: "WoVG-LS", vt_number: 18669 }
  ])



Unspsc.create([
  { unspsc_code: 10000000, unspsc_name: "Live Plant and Animal Material and Accessories and Supplies" },
  { unspsc_code: 11000000, unspsc_name: "Mineral and Textile and Inedible Plant and Animal Materials" },
  { unspsc_code: 12000000, unspsc_name: "Chemicals including Bio Chemicals and Gas Materials" },
  { unspsc_code: 13000000, unspsc_name: "Resin and Rosin and Rubber and Foam and Film and Elastomeric Materials" },
  { unspsc_code: 14000000, unspsc_name: "Paper Materials and Products" },
  { unspsc_code: 15000000, unspsc_name: "Fuels and Fuel Additives and Lubricants and Anti corrosive Materials" },
  { unspsc_code: 20000000, unspsc_name: "Mining and Well Drilling Machinery and Accessories" },
  { unspsc_code: 21000000, unspsc_name: "Farming and Fishing and Forestry and Wildlife Machinery and Accessories" },
  { unspsc_code: 22000000, unspsc_name: "Farming and Fishing and Forestry and Wildlife Machinery and Accessories" },
  { unspsc_code: 23000000, unspsc_name: "Industrial Manufacturing and Processing Machinery and Accessories" },
  { unspsc_code: 24000000, unspsc_name: "Material Handling and Conditioning and Storage Machinery and their Accessories and Supplies" },
  { unspsc_code: 25000000, unspsc_name: "Commercial and Military and Private Vehicles and their Accessories and Components" },
  { unspsc_code: 26000000, unspsc_name: "Power Generation and Distribution Machinery and Accessories" },
  { unspsc_code: 27000000, unspsc_name: "Tools and General Machinery" },
  { unspsc_code: 30000000, unspsc_name: "Structures and Building and Construction and Manufacturing Components and Supplies" },
  { unspsc_code: 31000000, unspsc_name: "Structures and Building and Construction and Manufacturing Components and Supplies" },
  { unspsc_code: 32000000, unspsc_name: "Electronic Components and Supplies" },
  { unspsc_code: 39000000, unspsc_name: "Electrical Systems and Lighting and Components and Accessories and Supplies" },
  { unspsc_code: 40000000, unspsc_name: "Distribution and Conditioning Systems and Equipment and Components" },
  { unspsc_code: 41000000, unspsc_name: "Laboratory and Measuring and Observing and Testing Equipment" },
  { unspsc_code: 42000000, unspsc_name: "Medical Equipment and Accessories and Supplies" },
  { unspsc_code: 43000000, unspsc_name: "Information Technology Broadcasting and Telecommunications" },
  { unspsc_code: 44000000, unspsc_name: "Office Equipment and Accessories and Supplies" },
  { unspsc_code: 45000000, unspsc_name: "Printing and Photographic and Audio and Visual Equipment and Supplies" },
  { unspsc_code: 46000000, unspsc_name: "Defence and Law Enforcement and Security and Safety Equipment and Supplies" },
  { unspsc_code: 47000000, unspsc_name: "Cleaning Equipment and Supplies" },
  { unspsc_code: 48000000, unspsc_name: "Service Industry Machinery and Equipment and Supplies" },
  { unspsc_code: 49000000, unspsc_name: "Sports and Recreational Equipment and Supplies and Accessories" },
  { unspsc_code: 50000000, unspsc_name: "Food and Beverage Products" },
  { unspsc_code: 51000000, unspsc_name: "Drugs and Pharmaceutical Products" },
  { unspsc_code: 52000000, unspsc_name: "Domestic Appliances and Supplies and Consumer Electronic Products" },
  { unspsc_code: 53000000, unspsc_name: "Apparel and Luggage and Personal Care Products" },
  { unspsc_code: 54000000, unspsc_name: "Timepieces and Jewellery and Gemstone Products" },
  { unspsc_code: 55000000, unspsc_name: "Published Products" },
  { unspsc_code: 56000000, unspsc_name: "Furniture and Furnishings" },
  { unspsc_code: 60000000, unspsc_name: "Developmental and professional teaching aids and materials and accessories and supplies" },
  { unspsc_code: 70000000, unspsc_name: "Farming and Fishing and Forestry and Wildlife Contracting Services" },
  { unspsc_code: 71000000, unspsc_name: "Mining and oil and gas services" },
  { unspsc_code: 72000000, unspsc_name: "Building and Construction and Maintenance Services" },
  { unspsc_code: 73000000, unspsc_name: "Industrial Production and Manufacturing Services" },
  { unspsc_code: 76000000, unspsc_name: "Industrial Cleaning Services" },
  { unspsc_code: 77000000, unspsc_name: "Environmental Services" },
  { unspsc_code: 78000000, unspsc_name: "Transportation and Storage and Mail Services" },
  { unspsc_code: 78000000, unspsc_name: "Management and Business Professionals and Administrative Services" },
  { unspsc_code: 80000000, unspsc_name: "Management and Business Professionals and Administrative Services" },
  { unspsc_code: 81000000, unspsc_name: "Engineering and Research and Technology Based Services" },
  { unspsc_code: 82000000, unspsc_name: "Editorial and Design and Graphic and Fine Art Services" },
  { unspsc_code: 83000000, unspsc_name: "Public Utilities and Public Sector Related Services" },
  { unspsc_code: 84000000, unspsc_name: "Financial and Insurance Services" },
  { unspsc_code: 85000000, unspsc_name: "Healthcare Services" },
  { unspsc_code: 86000000, unspsc_name: "Education and Training Services" },
  { unspsc_code: 90000000, unspsc_name: "Travel and Food and Lodging and Entertainment Services" },
  { unspsc_code: 91000000, unspsc_name: "Personal and Domestic Services" },
  { unspsc_code: 92000000, unspsc_name: "National Defence and Public Order and Security and Safety Services" },
  { unspsc_code: 93000000, unspsc_name: "Politics and Civic Affairs Services" },
  { unspsc_code: 94000000, unspsc_name: "Organisations and Clubs" }
])



# historic data... 5 years
# $100000 -> $500000000
# 34 per month
# 408 per year
# ~2000 records
# 365 * 7 = 2555



2000.times do |record|
  duration = Faker::Number.between(80, 2000)
  first_year = Faker::Number.between(10,14)
  start = Date.parse("20#{first_year}-#{Faker::Number.between(1, 12)}-#{Faker::Number.between(1, 28)}")
  finish = start + duration
  location = Faker::Address.street_address
  Contract.create({
    vt_contract_number: Faker::Company.duns_number,
    department_index: 0,
    status: "Expired",
    title: "#{Faker::Company.buzzword}, #{Faker::Company.catch_phrase} at #{location}",
    start_date: start,
    end_date: finish,
    total_value: duration * Faker::Number.between(1000, 200000),
    contract_type_index: 0,
    value_type_index: 0,
    status_index: 0,
    unspc_code: 30000000,
    contract_description: Faker::Lorem.sentence,
    department_id: Faker::Number.between(0, 19),
    supplier_id: 0,
    contact_id: 0,
    contract_type_id: 0,
    unspsc_id: 0,
    project_id: 0,
    address: location,
    status_id: 0
    })
end
