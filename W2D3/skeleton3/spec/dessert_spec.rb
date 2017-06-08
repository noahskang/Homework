require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef){double("chef", name: "Joe")}
  let(:cookie) {Dessert.new("cookie", 100, chef)}

  describe "#initialize" do

    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", "tons", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient( "tomatoes")
      expect(cookie.ingredients).to include("tomatoes")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(cookie.mix!.sort).to match_array(cookie.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      x = cookie.quantity
      expect(cookie.eat(2)).to eq(x - 2)
    end

    it "raises an error if the amount is greater than the quantity" do
      amount = cookie.quantity + 1
      expect(cookie.eat(amount)).to raise_error(RuntimeError "not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Joe the Great Baker")
      expect(brownie.serve).to eq("Chef Tucker the Great Baker has made 100 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
