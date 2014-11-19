class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.integer :publication_date
      t.references :author, index: true

      t.timestamps
    end
  end
end
