class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name,         null: false, default: ""
      t.string :surname,            null: false, default: ""
    end
  end
end
