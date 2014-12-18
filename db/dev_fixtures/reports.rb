r = Report.create!(
  name: 'Test 2x2',
  module_id: 'CP',
  record_type: 'case',
  aggregate_by: ["location_current", "protection_concerns"],
  disaggregate_by: ["age", "sex"],
)

sexes = ['Male', 'Female']
locations = ['Kenya', 'Uganda', 'Somalia', 'Ethiopia', 'Rwanda', 'Burundi', 'South Sudan', 'Tanzania']
protection_concerns = [
  "Sexually Exploited",
  "GBV survivor",
  "Trafficked/smuggled",
  "Statelessness",
  "Arrested/Detained",
  "Migrant",
  "Disabled",
  "Serious health issue",
  "Refugee",
  "CAAFAG",
  "Street child",
  "Child Mother",
  "Physically or Mentally Abused",
  "Living with vulnerable person",
  "Word Forms of Child Labor",
  "Child Headed Household",
  "Mentally Distressed",
  "Other"
]

(0..100).each do |i|
  concerns = []
  (0..rand(4)).each do |j|
    concerns << protection_concerns[rand(protection_concerns.size-1)] if j > 0
  end

  Child.create!(
    name: "Test Case #{i.to_s}",
    age: rand(18),
    sex: sexes[rand(1)],
    location_current: locations[rand(locations.size-1)],
    protection_concerns: concerns
  )
end