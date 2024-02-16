class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index"})
  end
  def show
    # Parameters: {"user_id"=>"christina"}
    user_info = params.fetch("user_id")
    matching_users = User.where({:username => user_info})
    @the_user = matching_users[0]

    if @the_user == nil
      redirect_to("/404")
    else 
      render({:template => "user_templates/show"})
    end
  end
  def add
    new_user = User.new

    new_user.username = params.fetch("username")

    new_user.save

    redirect_to("/users/#{new_user.username}")
  end
  def update
    the_id = params.fetch("user_id")
    matching_users = User.where({:id => the_id})
    updated_user = matching_users[0]

    updated_user.username = params.fetch("username")
   

    updated_user.save

   
    redirect_to("/users/#{updated_user.username}")
  end
end
