# frozen_string_literal: true

# Tasks controller
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
