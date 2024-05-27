require 'faker'

User.create email: 'admin@test.ts',
            password: 'password',
            role: 1
User.create email: 'emploee@test.ts',
            password: 'password'

20.times do
  User.create email: Faker::Internet.email,
              password: Faker::Internet.password(min_length: 6, max_length: 10),
              role: [0, 1].sample
end

50.times do
  Task.create user_id: User.pluck(:id).sample,
              task_type: [0, 1].sample,
              content: Faker::Lorem.paragraphs(number: 1)[0],
              status: [0,1,2].sample
end
