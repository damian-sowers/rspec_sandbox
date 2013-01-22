require 'spec_helper'

describe Book do
	#before each test. Can also do before all
	before :each do 
		@book = Book.new "Title", "Author", :category
	end

	describe "#new" do
		it "returns a new book object" do
			@book.should be_an_instance_of Book
			#@book.should(be_an_instance_of(Book))
		end

		it "throws an argumenterror when given fewer than 3 params" do
			lambda { Book.new "Title", "Author" }.should raise_exception ArgumentError
		end
	end

	describe "#title" do 
		it "returns the correct title" do 
			@book.title.should eql "Title"
			#@book.title.should == "Title"
		end
	end

	describe "#author" do 
		it "returns the correct author" do 
			@book.author.should == "Author"
		end
	end

	describe "#category" do 
		it "returns the correct category" do 
			@book.category.should == :category
		end
	end

end