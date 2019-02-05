require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoptions')

require('pry')

Adoption.delete_all()
Owner.delete_all()
Animal.delete_all()


#OWNERS

owner1 = Owner.new(
  {'first_name' => 'Ryan', 'last_name' => 'Taubert'}
)
owner1.save()

owner2 = Owner.new(
  {'first_name' => 'Collin', 'last_name' => 'Bull'}
)
owner2.save()

owner3 = Owner.new(
  {'first_name' => 'Benjamin', 'last_name' => 'Mead'}
)
owner3.save()

#PETS

pet1 = Animal.new(
  {'name' => 'Titus', 'type' => 'Dog', 'breed' => 'Bulldog', 'age' => '3 years',
   'status' => 'Unavailable', 'admission_date' => '13/08/18', 'description' =>
   'Titus is a great dog who loves to play fetch.','url' => "/images/bulldog.jpg" 'owner_id' => owner1.id}
)
pet1.save()

pet2 = Animal.new(
  {'name' => 'Lewie', 'type' => 'Cat', 'breed' => 'Bengal', 'age' => '6 months',
   'status' => 'Unavailable', 'admission_date' => '15/07/18', 'description' =>
   'Lewie is a good cat who likes to catch mice.', 'url' => "/images/bengal.jpg", 'owner_id' => owner2.id}
)
pet2.save()

pet3 = Animal.new(
  {'name' => 'Kratos', 'type' => 'Cat', 'breed' => 'Maine Coon', 'age' => '1 year',
   'status' => 'Unavailable', 'admission_date' => '20/11/18', 'description' =>
   'Kratos loves to chew and gnaw on everything.', 'url' => "/images/main_coon1.jpg", 'owner_id' => owner3.id}
)
pet3.save()

pet4 = Animal.new(
  {'name' => 'Rufus', 'type' => 'Dog', 'breed' => 'English Cocker Spaniel', 'age' => '6 years',
   'status' => 'Available', 'admission_date' => '23/03/18', 'description' =>
   'Rufus loves to play ball.', 'url' => "/images/eng_cocker_span.JPG"}
)
pet4.save()

pet5 = Animal.new(
  {'name' => 'Buddy', 'type' => 'Cat', 'breed' => 'Maine Coon', 'age' => '2.5 years',
   'status' => 'Available', 'admission_date' => '19/11/18', 'description' =>
   'Buddy is a cool cat who is mostly independant and takes care of himself.', 'url' => "/images/main_coon2.jpg"}
)
pet5.save()

adoption1 = Adoption.new(
  {'animal_id' => pet1.id, 'owner_id' => owner1.id}
)
adoption1.save()

adoption2 = Adoption.new(
  {'animal_id' => pet2.id, 'owner_id' => owner2.id}
)
adoption2.save()

adoption3 = Adoption.new(
  {'animal_id' => pet3.id, 'owner_id' => owner3.id}
)
adoption3.save()

binding.pry

nil
