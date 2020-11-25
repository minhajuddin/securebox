class AddOriginalFilenameToUploads < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :original_filename, :string
    execute <<~SQL
    UPDATE uploads
    SET original_filename = meta->>'original_filename'
    SQL
  end
end
