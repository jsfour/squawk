class CreateSquwakIdents < ActiveRecord::Migration
  def change
    create_table :squwak_idents do |t|
      t.string :uuid
      t.integer :identable_id
      t.string :identable_type

      t.timestamps
    end
  end
end
