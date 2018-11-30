class CreateClippings < ActiveRecord::Migration[5.2]
  def change
    create_table :clippings do |t|
      t.string :title
      t.text :paragraph
      t.string :url
      t.string :date
      t.string :source

      t.timestamps
    end
  end
end