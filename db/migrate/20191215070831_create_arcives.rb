class CreateArcives < ActiveRecord::Migration[5.2]
  def change
    create_table :arcives do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps
    end
  end
end
