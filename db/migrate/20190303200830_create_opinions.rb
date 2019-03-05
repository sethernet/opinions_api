class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.string :name
      t.integer :percentage_yes
      t.integer :percentage_no

      t.timestamps
    end
  end
end
