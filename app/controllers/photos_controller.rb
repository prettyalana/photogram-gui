class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "/photo_templates/index"})
  end
  # def show
  #   # Parameters: {"user_id"=>"christina"}
  #   user_info = params.fetch("user_id")
  #   matching_users = User.where({:username => user_info})
  #   @the_user = matching_users[0]

  #   if @the_user == nil
  #     redirect_to("/404")
  #   else 
  #     render({:template => "user_templates/show"})
  #   end
  # end
end
