class CreateSatelights < ActiveRecord::Migration[5.2]
  def change
    create_table :satelights do |t|
      t.string :name1
      t.string :name2
      t.string :name3

      t.timestamps
    end
  end
end
