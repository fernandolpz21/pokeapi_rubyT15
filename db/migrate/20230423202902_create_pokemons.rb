class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.text :types
      t.text :abilities
      t.string :sprite

      t.timestamps
    end
    add_index :pokemons, :name
  end
end
