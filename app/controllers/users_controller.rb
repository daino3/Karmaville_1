class UsersController < ApplicationController
  def index
    @page = (params[:page] || 1).to_i
    @results_per_page = 25
    # @number_of_pages = User.all.count/@results_per_page
    @users = User.by_karma.page(@page, @results_per_page)
    @number_of_pages = User.number_of_pages(@results_per_page)
  end

  # def move #deleted all this because we can access page parameters via index
  #   @results_per_page = 25
  #   @page = params[:id].to_i
  #   # @number_of_pages = User.all.count/@results_per_page
  #   @users = User.by_karma.page(@page, @results_per_page)
  #   render 'index'
  # end

end
