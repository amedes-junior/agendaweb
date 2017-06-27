class AddFieldsIntoContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :birthdate, :date
    add_column :contacts, :address, :string
  end
end
