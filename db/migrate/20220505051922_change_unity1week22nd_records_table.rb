class ChangeUnity1week22ndRecordsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :unity1week22nd_records, :picture_id
    add_column :unity1week22nd_records, :picture_name, :string
  end
end
