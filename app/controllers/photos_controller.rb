class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @photo = Photo.where({:id => the_id }).at(0)

    render({ :template => "photos/show.html.erb" })
  end

  def create
    @photo = Photo.new
    @photo.update_id = @current_user.last_update
    @photo.image_url = params.fetch("image_url_from_query", nil)
    @photo.caption = params.fetch("caption_from_query", nil)

    if @photo.valid?
      @photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :notice => "Photo failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @photo = Photo.where({ :id => the_id }).at(0)

    @photo.update_id = params.fetch("update_id_from_query")
    @photo.image_url = params.fetch("image_url_from_query")
    @photo.caption = params.fetch("caption_from_query")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{@photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @photo = Photo.where({ :id => the_id }).at(0)

    @photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
