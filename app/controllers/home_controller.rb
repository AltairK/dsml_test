# frozen_string_literal: true

# Index class, show list of available applications
class HomeController < ApplicationController
  def index
    @tasks = Task.all
  end
end
