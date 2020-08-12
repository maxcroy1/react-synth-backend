class CreatePresets < ActiveRecord::Migration[6.0]
  def change
    create_table :presets do |t|
    	t.integer :user_id
    	t.integer :synth_setting_id
      t.timestamps
    end
  end
end
