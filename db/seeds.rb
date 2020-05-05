# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Task.delete_all 
Project.delete_all 

NUM_PROJECT = 200
DATE = '19/09/1985'

NUM_PROJECT.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
      p = Project.create(
        title: Faker::BossaNova.artist ,
        description: Faker::ChuckNorris.fact,
        due_date: DATE,
        created_at: created_at,
        updated_at: created_at
    )
    if p.valid? 
        p.tasks_id = rand(0..15).times.map do 
          Task.new(
            title: Faker::Hacker.say_something_smart, 
            due_date: DATE,
            created_at: created_at,
            updated_at: created_at,
            body: Faker::GreekPhilosophers.quote
          )
        end
    end
end


project = Project.all 
task = Task.all

puts Cowsay.say("Generated #{project.count} projects", :frogs)
puts Cowsay.say("Generated #{task.count} tasks", :tux)
