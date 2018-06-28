require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Chang") }
  subject(:mousse) { Dessert.new("fat", 20, :chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(mousse.type).to eq("fat")
    end
    it "sets a quantity" do
      expect(mousse.quantity).to eq(20)
    end
    it "starts ingredients as an empty array" do
      expect(mousse.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("fat", "too much", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(mousse.ingredients).to be_empty
      mousse.add_ingredient("lard")
      expect(mousse.ingredients).to include("lard")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      mousse.add_ingredient("lard")
      mousse.add_ingredient("butter")
      mousse.add_ingredient("bacon grease")
      ingredient_list = mousse.ingredients.dup
      mousse.mix!
      expect(mousse.ingredients).not_to eq(ingredient_list)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      mousse.eat(19)
      expect(mousse.quantity).to eq(1)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { mousse.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Chang the Great Baker")
      expect(mousse.serve).to eq("Chef Chang the Great Baker has made 100 fats!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(mousse)
      mousse.make_more
    end
  end
end
