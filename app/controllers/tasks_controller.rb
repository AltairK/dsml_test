# frozen_string_literal: true

# Tasks controller
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    admins = User.where role: 'admin'
    params.permit!
    Task.create params[:task].merge!(user_id: current_user.id, status: 0)
    admins.each do |admin|
      TaskMailer.mailer(admin, current_user).deliver_now
    end
    redirect_to root_path
  end

  def actions
    task = Task.find params[:id]
    case params[:act].to_i
    when 1
      task.status = 1
    when 2
      task.status = 2
    end
    task.save
    redirect_to request.referrer
  end

  private

  def task_params
    params.require(:task).permit(:user_id,
                                 :task_type,
                                 :content)
  end
end
