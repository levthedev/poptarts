class CreatePopTart < ActiveRecord::Migration
  def change
    create_table :pop_tarts do |t|
      t.string :flavor
      t.string :sprinkles
    end
  end
end
