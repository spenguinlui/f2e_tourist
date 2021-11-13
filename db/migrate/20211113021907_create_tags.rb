class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :theme_name
      t.string :collections, array: true

      t.timestamps
    end
  end
end
