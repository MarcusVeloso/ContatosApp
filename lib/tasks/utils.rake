namespace :utils do

  desc "Popular banco de dados."  
  task seed: :environment do  
	puts "Genereting Contacts..."
	 	10.times do |i|
			Contact.create!(
				name: Faker::Name.name,
				email: Faker::Internet.email,
				kind: Kind.all.sample,				
				remarkable: Faker::Lorem.paragraph([1,2,3].sample)
				)
		 end
	puts "Genereting Contacts finished!"

	puts "Genereting Adresses..."
      Contact.all.each do |contact|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
        )
      end
	puts "Genereting Adresses finished!"

	puts "Genereting Phones..."
		Contact.all.each do |c|
			Random.rand(1..5).times do |i|
				Phone.create!(
					phone: Faker::PhoneNumber.phone_number,
					contact: c
				)
			end
		end
	puts "Genereting Phones finished"
  end

end