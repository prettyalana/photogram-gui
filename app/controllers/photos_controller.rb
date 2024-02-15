class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "/photo_templates/index" })
  end

  def show
    # Parameters: {"image"=>"lala", "caption"=>"lala", "owner_id"=>"113", "photo_id"=>"show"}
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

  def add
    # Parameters: {"image"=>"https://www.theodinproject.com/assets/icons/odin-icon-a34029cd84a741be4da27758dafd7d7ac3729021adea3e0701e310d91e5c1d04.svg", "caption"=>"Odin", "owner_id"=>"115"}
    new_photo = Photo.new
    new_photo.image = params.fetch("image")
    new_photo.caption = params.fetch("caption")
    new_photo.owner_id = params.fetch("owner_id")

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def add_comment
    new_comment = Comment.new
    new_comment.photo_id = params.fetch("input_photo_id")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")

    new_comment.save

    redirect_to("/photos")
  end

  def update
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => the_id})
    updated_photo = matching_photos[0]

    updated_photo.image = params.fetch("input_photo")
    updated_photo.caption = params.fetch("input_caption")

    updated_photo.save

   
    redirect_to("/photos/#{updated_photo.id.to_s}")
  end
end
