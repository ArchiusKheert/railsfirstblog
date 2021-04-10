class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.string :first_name
      t.string :last_name
      t.string :team
      t.string :country
      t.date :birth_date

      t.timestamps
    end
  end
end
