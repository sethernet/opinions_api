class CreateArguments < ActiveRecord::Migration[5.2]
  def change
    create_table :arguments do |t|
      t.string :author_name
      t.integer :opinion_id

      t.timestamps
    end
  end
end
