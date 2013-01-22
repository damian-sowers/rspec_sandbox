require 'spec_helper'

describe "Library Object" do
	
	before :all do
		lib_arr = [
			Book.new("Javascript", "Douglas Crockford", :development),
			Book.new("Design", "Damian Sowers", :design),
			Book.new("Don't make me think", "Steve Krug", :development)
		]

		#open up the file in write mode "w"
		File.open "books.yml", "w" do |f|
			#need to :: because yaml is a module
			f.write YAML::dump lib_arr
		end
	end

	before :each do 
		@lib = Library.new "books.yml"
	end

	describe "#new" do
		context "with no parameters" do 
			it "has no books" do
				lib = Library.new
				lib.should have(0).books #or lib.books.length.should == 0
			end
		end

		context "with a yaml file name parameter" do
			it "has three books" do
				@lib.should have(3).books
			end
		end
	end

	it "returns all the books ina  given category" do 
		@lib.get_books_in_category(:development).length.should == 2
	end

	it "accepts new books" do 
		@lib.add_book( Book.new("Designing for the web", "Mark Boulton", :design))
		@lib.get_book( "Designing for the web").should be_an_instance_of Book
	end

	it "saves the library" do 
		books = @lib.books.map { |book| book.title }
		@lib.save "our_new_library.yml"
		lib2 = Library.new "our_new_library.yml"
		books2 = lib2.books.map { |book| book.title }
		books.should eql books2
	end
end
	