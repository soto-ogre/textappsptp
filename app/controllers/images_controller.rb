class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @image = Image.new
  end

  def create
    @image = Image.new(file_name: params[:file])
    if @image.save
      render json: { message: "success", fileID: @image.id, name: @image.name, file_name: @image.file_name}, :status => 200
      
    else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    end
  end

  def show
    @image = Image.new(file_name: params[:file])
    if @image.save!
      respond_to do |format|
        format.json{ render :json => @image }
      end
    end
  end

  private


def images_params
  params.require(:image).permit(:name,file_name:params[:file])
end
end

