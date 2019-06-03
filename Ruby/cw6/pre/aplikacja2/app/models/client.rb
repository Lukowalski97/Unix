class Client < ApplicationRecord
    validates :name, :surname, :mail, :city, presence: true, length: { minimum: 2}
    validates :name, :surname, :city, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters allowed" }
    validates :mail, format: {with: /(\d|\w)+@(\d|\w)+[.](\d|\w)+/, message: "Mail should be: sth@sth.sth "}, uniqueness: true
end
