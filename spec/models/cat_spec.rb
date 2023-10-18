require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create(age: 5, hobbies: 'eating toilet paper', image: 'https://unsplash.com/photos/7DXQtl__9Cw')
    expect(cat.errors[:name]).to_not be_empty
  end
  it "should validate age" do
    cat = Cat.create(name: 'Franklin', hobbies: 'eating toilet paper', image: 'https://unsplash.com/photos/7DXQtl__9Cw')
    expect(cat.errors[:age]).to_not be_empty
  end
  it "should validate hobbies" do
    cat = Cat.create(name: 'Franklin', age: 5, image: 'https://unsplash.com/photos/7DXQtl__9Cw')
    expect(cat.errors[:hobbies]).to_not be_empty
  end
  it "should validate image" do
    cat = Cat.create(name: 'Franklin', age: 5, hobbies: 'eating toilet paper')
    expect(cat.errors[:image]).to_not be_empty
  end
end
