class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :s3_key
      t.jsonb :meta

      t.timestamps
    end
  end
end
