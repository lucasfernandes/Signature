class AddFileToAssets < ActiveRecord::Migration
  def change
    change_table :assets do |t|
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
    end
  end
end
