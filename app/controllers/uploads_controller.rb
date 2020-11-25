class UploadsController < ApplicationController
  def index
    @current_user = OpenStruct.new(name: "Dan")
    @uploads = Upload.all
  end

  def create
    Upload.store(params["file"])
    redirect_to "/"
  end

  def download
    upload = Upload.find(params[:id])
    send_file upload.path
  end
end
