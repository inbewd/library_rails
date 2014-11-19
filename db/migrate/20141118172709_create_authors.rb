class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :nationality
      t.integer :birth_year

      t.timestamps
    end
  end
end
