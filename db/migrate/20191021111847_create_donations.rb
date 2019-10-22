class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user
      t.references :donation_type
      
      t.timestamps
    end
  end
end
