require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'respond to' do
    it { should respond_to(:category) }
    it { should respond_to(:content) }
  end

  describe 'validations' do
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:content) }
  end

  describe 'enums' do
    it 'categories' do
      expect(Post.categories).to eq({
        'world'    => 1,
        'business' => 2,
        'tech'     => 3,
        'sport'    => 4
      })
    end
  end
end
