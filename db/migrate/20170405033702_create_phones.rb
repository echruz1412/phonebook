class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.integer :nphone,
      t.text :status,
      t.references :contact, foreign_key: true,

      t.timestamps
    end
  end
end
