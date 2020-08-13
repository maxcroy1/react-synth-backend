class CreateSynthSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :synth_settings do |t|
    	t.string :synth
    	t.string :effect
    	t.integer :gain 
    	t.integer :reverb_wet
    	t.integer :reverb_decay
      t.timestamps
    end
  end
end
