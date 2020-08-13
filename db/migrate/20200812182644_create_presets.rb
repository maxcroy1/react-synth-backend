class CreatePresets < ActiveRecord::Migration[6.0]
  def change
    create_table :presets do |t|
    	t.references :user, foreign_key: true
    	t.references :synth_setting, foreign_key: true
      t.timestamps
    end
  end
end
