class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :presets
    has_many :synth_settings, through: :presets
end
