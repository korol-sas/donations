class AddDateToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :donated_at, :datetime
  end
end
