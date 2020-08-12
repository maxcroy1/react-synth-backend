# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
SynthSetting.destroy_all
Preset.destroy_all

10.times do 
	puts "creating user"
	User.create(username: Faker::Music::RockBand.name , password: "password")
end

10.times do
	puts "creating SynthSettings"
	SynthSetting.create(synth: Faker::Music.instrument, effect: Faker::Space.galaxy)
end

10.times do
	puts "creating synth-profiles"
	Preset.create(user_id: User.all.sample.id, synth_setting_id: SynthSetting.all.sample.id)
end