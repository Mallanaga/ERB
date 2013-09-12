class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :website
      t.date :acquired
      t.text :about
      t.text :testimonial

      t.timestamps
    end
  end
end