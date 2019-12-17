class AddCalendersPhotoImages < ActiveRecord::Migration[5.2]
  def change
    #photoimage
    add_column :calenders, :photo1, :string
    add_column :calenders, :photo2, :string
    add_column :calenders, :photo3, :string
    add_column :calenders, :photo4, :string
    add_column :calenders, :photo5, :string
    add_column :calenders, :photo6, :string
    add_column :calenders, :photo7, :string
    add_column :calenders, :photo8, :string
    add_column :calenders, :photo9, :string
    add_column :calenders, :photo10, :string
    #photoimage
    add_column :calenders, :data1, :string
    add_column :calenders, :data2, :string
    add_column :calenders, :data3, :string
    add_column :calenders, :data4, :string
    add_column :calenders, :data5, :string
    add_column :calenders, :data6, :string
    add_column :calenders, :data7, :string
    add_column :calenders, :data8, :string
    add_column :calenders, :data9, :string
    add_column :calenders, :data10, :string
    #time
    add_column :calenders, :datetime, :string
    #nation
    add_column :calenders, :nation, :string

  end
end
