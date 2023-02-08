class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :content
      t.date :published_at
      t.integer :pages
      t.belongs_to :author
      t.timestamps
    end
  end
end
