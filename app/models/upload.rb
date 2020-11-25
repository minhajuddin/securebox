class Upload < ApplicationRecord
  DATA_DIR = Rails.root.join("data")

  def self.store(file)
    upload = Upload.create! s3_key: "foo", original_filename: file.original_filename
    FileUtils.mkdir_p(upload.folder)
    FileUtils.cp(file.path, upload.path)
  end

  def folder
    File.dirname(path)
  end

  def path
    DATA_DIR.join(id.to_s, original_filename)
  end
end

# s3 = Aws::S3::Client.new(region: "us-east-1")
# s3.put_object({ body: file.read, bucket: "staticgarden-scratch", key: file.original_filename})
