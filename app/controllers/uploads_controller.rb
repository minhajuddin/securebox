class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def create
    file = params["file"]
    # s3 = Aws::S3::Client.new(region: "us-east-1")
    # s3.put_object({ body: file.read, bucket: "staticgarden-scratch", key: file.original_filename})
    upload = Upload.create! s3_key: "foo", meta: {original_filename: file.original_filename}
    dir = "data/#{upload.id}"
    FileUtils.mkdir dir
    FileUtils.cp file.path, "#{dir}/#{file.original_filename}"
    redirect_to "/"
  end
end
