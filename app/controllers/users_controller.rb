class UsersController < ApplicationController
  def index
    @page = 1
    @results_per_page = 25
    # @number_of_pages = User.all.count/@results_per_page
    @users = User.by_karma.page(@page, @results_per_page)
  end

  def move
    @results_per_page = 25
    @page = params[:id].to_i
    # @number_of_pages = User.all.count/@results_per_page
    @users = User.by_karma.page(@page, @results_per_page)
    render 'index'
  end

end
