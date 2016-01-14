# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LEVELS = %w[A1 A2 B1 B2 C1]

Timecop.freeze Chronic.parse('last sunday at 12:00')
#IceCube.compatibility = 12 # ?

Fabricator(:student) do
  name { Faker::Name.name }
  phone { Faker::PhoneNumber.phone_number }
  date_of_birth { Faker::Date.between(3.years.ago, 45.years.ago) }
  level { LEVELS.sample }
end

Fabricator(:group) do
  students(count: (3..7).to_a.sample)
  level { LEVELS.sample }
end

a = ['Izzy', 'Marina', 'Stefan']
b = ['red', 'blue', 'green']
Hash[a.zip b].each do |k, v|
  Teacher.create(name: k, color: v)
end
#Teacher.create(name: "Izzy", color: 'red')
#Teacher.create(name: "Marina", color: 'blue')

4.times { Fabricate(:group) }
sched =[{1 => Time.parse('17:00')},
        {3 => Time.parse('18:00')},
        {2 => Time.parse('17:00')}, 
        {4 => Time.parse('18:00')}]


p Group.all.size
g = Group.find(1)
g.add_biweekly_schedule(1, 3, '17:00')
g = Group.find(2)
g.add_biweekly_schedule(2, 4, '18:30')

Group.all.each_with_index do |g, i|
  puts 'doing gropup' + i.to_s
  g.update(teacher_id: Teacher.all.sample.id)
  #g.weekly_classes.create(starts_at: sched[i].values.first, ends_at: sched[i].values.first + 60*60, day_of_week: 2)
  #g.weekly_classes.create(starts_at: sched[i].values.first, ends_at: sched[i].values.first + 60*60, day_of_week: sched[i].keys.first + 2)
end

Timecop.return
