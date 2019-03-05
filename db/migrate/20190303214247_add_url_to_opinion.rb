class AddUrlToOpinion < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :url, :string
  end
end
