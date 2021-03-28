class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :download_url
      t.string :status

      t.timestamps
    end
  end
end
