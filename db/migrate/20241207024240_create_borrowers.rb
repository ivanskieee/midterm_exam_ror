class CreateBorrowers < ActiveRecord::Migration[7.2]
  def change
    create_table :borrowers do |t|
      t.string :name

      t.timestamps
    end
  end
end
