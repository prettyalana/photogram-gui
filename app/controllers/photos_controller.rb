class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "/photo_templates/index" })
  end

  def show
    photo_info = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => photo_info })
    @the_photo = matching_photos[0]

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show" })
    end
  end

  def delete
    photo_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => photo_id })
    the_photo = matching_photos[0]

    the_photo.destroy

    redirect_to("/photos")
  end
end
