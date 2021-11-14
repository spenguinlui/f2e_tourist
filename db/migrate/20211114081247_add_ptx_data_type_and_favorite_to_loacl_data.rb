class AddPtxDataTypeAndFavoriteToLoaclData < ActiveRecord::Migration[6.0]
  def change
    add_column :local_data, :ptx_data_type, :string, default: 0
    add_column :local_data, :favorite_count, :integer, default: 0
  end
end
