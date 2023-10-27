class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :guid
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
