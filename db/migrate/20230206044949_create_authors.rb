class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :date_of_birth
      t.timestamps
    end
  end
end
