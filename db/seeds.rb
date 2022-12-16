# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

seed_tutors = [
  { first_name: 'Faiza', last_name: 'Khan', email: 'fk2421@columbia.edu', phone: '4138010773', bio: 'I am a CVN CS Columbia Masters Student and a Software Engineer at JPMorgan Chase. I have prior teaching experience in Computer Networks and believe that I will be an excellent peer tutor for Engineering Software as a Service as well.', created_at: '25-Oct-2022', updated_at: '25-Oct-2022', :id =>'1' },
  { first_name: 'Md Monirul', last_name: 'Islam', email: 'im2594@columbia.edu', phone: '7744058614', bio: 'I am a CVN CS Columbia Masters Student working at Coinbase', created_at: '25-Oct-2022', updated_at: '25-Oct-2022', :id => '2'},
]

seed_tutors.each do |tutor|
  Tutor.create!(tutor)
end
