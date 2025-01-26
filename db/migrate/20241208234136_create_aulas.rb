class CreateAulas < ActiveRecord::Migration[8.0]
  def change
    create_table :aulas do |t|
      t.string :titulo
      t.string :video_url
      t.references :curso, null: false, foreign_key: true
      t.boolean :liberada

      t.timestamps
    end
  end
end
