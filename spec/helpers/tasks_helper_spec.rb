require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  describe 'Task' do
    before do
      @user_admin = User.create email: 'test_admin@test.ts', password: 'password', role: 1
      @user_emploee = User.create email: 'test_emploee@test.ts', password: 'password'
      @task = Task.create user_id: @user_emploee.id,
                          task_type: [0, 1].sample,
                          content: 'test content',
                          status: 0
    end

    describe 'tasks list' do
      it 'show list of tasks' do
        expect(@task.user_id).to equal(@user_emploee.id)
      end
    end
  end
end
