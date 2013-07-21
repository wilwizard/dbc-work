class UsersController < ApplicationController
  def index
    @cur_page = params[:page].to_i
    @users = User.by_karma.page(@cur_page.to_i)
    @page_count = (User.count/50.0).ceil
  end
end
