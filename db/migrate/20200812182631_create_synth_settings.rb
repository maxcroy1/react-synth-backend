class CreateSynthSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :synth_settings do |t|
    	t.string :synth
    	t.string :effect
      t.timestamps
    end
  end
end
