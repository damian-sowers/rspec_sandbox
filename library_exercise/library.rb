require 'yaml'

class Library
	attr_accessor :books

	def initialize lib_file = false
		@lib_file = lib_file
		@books = @lib_file ? YAML::load(File.read(@lib_file)) : []
	end	

	def get_books_in_category category
		#select loops through the items in the array and if it equals true it keeps it in the returned array
		@books.select do |book|
			book.category == category
		end
	end

	def add_book book
		@books.push book
	end

	def get_book title
		#we are assuming there is only one book with this title, need to call first to return the individual book, rather than an array with this one book inside
		@books.select { |book| book.title == title }.first
	end

	def save lib_file = false
		#giving three options. Will save it as the option passed into save, or as the originally iniitialized file name, or as Library.yml
		@lib_file = lib_file || @lib_file || "Library.yml"
		File.open @lib_file, "w" do |f|
			f.write YAML::dump @books
		end
	end
end