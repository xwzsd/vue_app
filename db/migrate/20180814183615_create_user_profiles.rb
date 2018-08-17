class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :surname
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
