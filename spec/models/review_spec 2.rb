require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'validation tests' do

    it 'ensures rating is numerical value' do
        review = Review.new(rating:'3').save
        expect(review).to eq(true)
    end
    it 'ensures rating value is present' do
        review = Review.new(comment:'awesome').save
        expect(review).to eq(false)
    end
    it 'should not save a review if rating is non-numeric' do
        review = Review.new(rating: 'abc', comment: '').save
        expect(review).to eq(false)
    end
    it 'should successfully save a review if rating is present and comment is not' do
        review = Review.new(rating: '5', comment: '').save
        expect(review).to eq(true)
    end
    it 'should not save a review if rating and comment are not present' do
        review = Review.new(rating: '', comment: '').save
        expect(review).to eq(false)
    end
  end
end