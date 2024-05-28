require 'rails_helper'
require 'faker'

RSpec.describe Task, type: :model do
  let(:user_admin) do
    User.create email: Faker::Internet.email,
                password: Faker::Internet.password(min_length: 8),
                role: 1
  end

  let(:user_emploee) do
    User.create email: Faker::Internet.email,
                password: Faker::Internet.password(min_length: 8)
  end

  it 'is valid with valid attributes' do
    expect(Task.new(user_id: user_admin.id,
                    task_type: [0, 1].sample,
                    content: Faker::Lorem.paragraphs(number: 1)[0],
                    status: [0, 1, 2].sample)).to be_valid
  end

  it 'is valid with not valid user and content' do
    expect(Task.new(user_id: 178,
                    task_type: [0, 1].sample,
                    content: nil,
                    status: [0, 1, 2].sample)).to_not be_valid
  end

  it 'belongs_to user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'user is admin' do
    expect(user_admin.admin?).to be true
  end

  it 'user is emploee' do
    expect(user_emploee.admin?).to be false
  end

  it 'send email' do
    expect { TasksController.create }.to send_email
  end
end
