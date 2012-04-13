class PhotosController < ApplicationController
  load_and_authorize_resource :room

  def edit
  end

  def create
    file = params[:qqfile].is_a?(ActionDispatch::Http::UploadedFile) ? params[:qqfile] : params[:file]
    @photo = @room.photos.new(image: file)

    if @photo.save
      render json: {:success => true, :content => render_to_string(partial: "thumbnail", locals: {photo: @photo})}
    else
      render json: @photo.errors.to_json
    end
  end
end
