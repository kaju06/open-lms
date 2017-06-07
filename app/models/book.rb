require 'csv'
class Book < ApplicationRecord
    has_many :student_books
    has_many :students,through: :student_books
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Book.create! row.to_hash
        end
    end    
end
