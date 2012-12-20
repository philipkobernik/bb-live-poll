class CreateKitties < ActiveRecord::Migration
  def change
    create_table :kitties do |t|
      t.string :name
      t.integer :lives

      t.timestamps
    end
  end
end
