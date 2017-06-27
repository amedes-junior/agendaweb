class AddGenderIntoContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :gender, :char
  end
end
