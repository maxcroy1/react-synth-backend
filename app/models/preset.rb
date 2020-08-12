class Preset < ApplicationRecord
	belongs_to :user
	belongs_to :synth_setting
end
