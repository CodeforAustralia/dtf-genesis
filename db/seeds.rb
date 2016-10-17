# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


contracts = Contract.create([
  {
    contract_number: "-1",
    status: "weird",
    title: "Not a normal contract",
    start_date: Date.parse("31-1-2016").to_s,
    end_date: Date.parse("31-12-2016").to_s,
    total_value: 0,
    created_at: Date.today.to_s,
    updated_at: Date.today.to_s,
    department_index: 1,
    contract_type_index: 1,
    value_type_index: 1,
    status_index: 1,
    unspc_code: 700000,
    contract_description: "some long convoluted\npossibly\nmultiline\n\npossibly\n\r\n\rbadly \r\nformatted \r\r\n\ndescription"
  },
  {
    contract_number: "2",
    status: "2",
    title: "2",
    start_date: Date.parse("1-1-2016").to_s,
    end_date: Date.parse("1-1-2016").to_s,
    total_value: 2,
    created_at: Date.today.to_s,
    updated_at: Date.today.to_s,
  },
{ contract_number: "T2010DPC14", status: "Awarded", title: "Asset Management Framework  specification documents (Arts Victoria)", start_date: Date.parse("18-8-2010").to_s, end_date: Date.parse("9-9-2010").to_s, total_value:180000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "311635 ", status: "Awarded", title: "Elwood Beach Renourishment Civil Works  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("10-11-2010").to_s, end_date: Date.parse("2-12-2010").to_s, total_value:1027565, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "312590 ", status: "Awarded", title: "Supply and Install amenities building at Forrest, Western Victoria  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("9-2-2011").to_s, end_date: Date.parse("3-3-2011").to_s, total_value:323857, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "312808 ", status: "Awarded", title: "Replacement of Mt Mittamatite Fire Tower  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("23-2-2011").to_s, end_date: Date.parse("10-3-2011").to_s, total_value:130000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "312770 ", status: "Awarded", title: "Beech Creek Trestle Bridge - Bush Fire Reconstruction  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("16-2-2011").to_s, end_date: Date.parse("17-3-2011").to_s, total_value:405093, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "313014 ", status: "Awarded", title: "Assessment of Current and Future Infrastructure Requirements of Key Indigenous Organisations in Victoria  specification documents (Department of Planning and Community Development)", start_date: Date.parse("16-3-2011").to_s, end_date: Date.parse("7-4-2011").to_s, total_value:357819, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "312850 ", status: "Awarded", title: "The Strand, Williamstown Rock Sea Wall  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("23-3-2011").to_s, end_date: Date.parse("7-4-2011").to_s, total_value:564852, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "312799 ", status: "Awarded", title: "FIRE SERVICES AND HYDRAULIC INSTALLATION DEPARTMENT OF SUSTAINABILITY AND ENVIRONMENT NOOJEE WORK CENTRE  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("23-3-2011").to_s, end_date: Date.parse("13-4-2011").to_s, total_value:412500, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "313050 ", status: "Awarded", title: "CONSTRUCT AMENITIES BUILDING LATROBE VALLEY AIRBASE  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("6-4-2011").to_s, end_date: Date.parse("4-5-2011").to_s, total_value:319700, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "313144 ", status: "Awarded", title: "Construction of 80 metres of rock seawall and associated civil earthworks at Tooradin Foreshore, Westernport  specification documents (Department of Environment and Primary Industries)", start_date: Date.parse("11-5-2011").to_s, end_date: Date.parse("26-5-2011").to_s, total_value:130000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "T12075 ", status: "Awarded", title: "Consultant Project Manager - Specialist: Property Management & Town Planning  specification documents (Dept of Health - Capital Projects and Service Planning - CLOSED (See DHHS))", start_date: Date.parse("6-6-2012").to_s, end_date: Date.parse("21-6-2012").to_s, total_value:539968, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "T12076 ", status: "Awarded", title: "Consultant Architect - Health Buildings  specification documents (Dept of Health - Capital Projects and Service Planning - CLOSED (See DHHS))", start_date: Date.parse("6-6-2012").to_s, end_date: Date.parse("21-6-2012").to_s, total_value:325248, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "TAC-HM-2012 ", status: "Awarded", title: "Home Modifications Program Manager Tender  specification documents (Transport Accident Commission)", start_date: Date.parse("24-10-2012").to_s, end_date: Date.parse("29-11-2012").to_s, total_value:2400000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "MV 12 003MV ", status: "Awarded", title: "Vertical Transport Systems Maintenace  specification documents (Museum Victoria)", start_date: Date.parse("24-4-2013").to_s, end_date: Date.parse("24-5-2013").to_s, total_value:500000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "GRV1314-46", status: "Awarded", title: "TRARALGON GREYHOUND RACECOURSE REDEVELOPMENT CIVIL ENGINEERING (MAIN) WORKS  specification documents (Greyhound Racing Victoria)", start_date: Date.parse("19-3-2014").to_s, end_date: Date.parse("14-4-2014").to_s, total_value:3785164, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "GRV1314-47", status: "Awarded", title: "Traralgon Greyhound Events and Race Day Facilities Development  specification documents (Greyhound Racing Victoria)", start_date: Date.parse("2-4-2014").to_s, end_date: Date.parse("6-5-2014").to_s, total_value:2413514, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "RFT2015-0291 ", status: "Awarded", title: "Provision of Essential Service Measures Maintenance, Mechanical Maintenance and Lift Maintenance  specification documents (Court Services Victoria)", start_date: Date.parse("4-11-2015").to_s, end_date: Date.parse("1-12-2015").to_s, total_value:5655000, created_at: Date.today.to_s, updated_at: Date.today.to_s },
{ contract_number: "330117 ", status: "Awarded", title: "Construction of a stepped concrete seawall at Sorrento foreshore  specification documents (Department of Environment, Land, Water and Planning)", start_date: Date.parse("30-3-2016").to_s, end_date: Date.parse("28-4-2016").to_s, total_value:824137, created_at: Date.today.to_s, updated_at: Date.today.to_s },





])
