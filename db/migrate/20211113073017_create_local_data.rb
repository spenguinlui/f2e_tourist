class CreateLocalData < ActiveRecord::Migration[6.0]
  def change
    create_table :local_data do |t|
      t.string :ptx_data_id, null: false
      t.json :feature
      t.json :menu
      t.integer :search_count, default: 0
      t.integer :enter_count, default: 0

      t.timestamps
    end
  end
end
