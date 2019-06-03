# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.delete_all              # Usunięcie poprzedniej zawartości BD
Client.create!(                # Utworzenie rekordów w BD
  [
    {name: 'Jan',surname: 'Kowalski', mail: 'Jan@mail.com', city: 'Kraków'}, 
    {name: 'John',surname: 'Doe', mail: 'John@mail.com', city: 'New York'}, 
    {name: 'Test',surname: 'Testowy', mail: 'test@mail.com', city: 'Testoland'}  
  ]
)