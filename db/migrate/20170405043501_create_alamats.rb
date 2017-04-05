class CreateAlamats < ActiveRecord::Migration[5.0]
  def change
    create_table :alamats do |t|
      t.string :address
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
