class SynthSetting < ApplicationRecord
	has_many :presets
  has_many :users, through: :presets

end
