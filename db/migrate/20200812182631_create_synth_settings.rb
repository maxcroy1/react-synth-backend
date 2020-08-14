class CreateSynthSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :synth_settings do |t|
    	t.string :synth
    	t.float :gain 
    	t.float :reverb_wet
    	t.float :reverb_decay
      t.timestamps
    end
  end
end
