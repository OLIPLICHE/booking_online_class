equire 'rails_helper'

RSpec.describe Course, type: :model do
  let(:user) { User.create(name: 'Paka', email: 'example@mail.com', password: 'mypassword') }
  let(:course) do
    Course.create(user_id: user.id, title: 'Ruby on Rails module', picture: 'logo.png', city: 'Yakto', country: 'France', short_description: 'lala lallal', description: 'Zoz zoz ozoz', language: 'french', level: 'Beginner',
                  price: '100', date_start: '2015-01-9', date_end: '2015-01-10')
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(course).to be_valid }
    end
  end

  it 'should allow valid name' do
    course.title = nil
    expect(course).to_not be_valid
  end

  it 'should allow valid name' do
    course.title = 'Ruby'
    expect(course).to be_valid
  end

  it 'should allow valid name' do
    course.name = 'Ruby' * 50
    expect(course).to_not be_valid
  end

  it 'should validate price' do
    course.price = -5
    expect(course).to_not be_valid
  end

  it 'should validate price' do
    course.price = 10
    expect(course).to be_valid
  end

  it 'should validate price' do
    course.price = 0
    expect(course).to be_valid
  end

  it 'should validate the image link' do
    course.picture = nil
    expect(course).to_not be_valid
  end

  it 'should validate the image link' do
    course.picture = 'logo.png'
    expect(course).to be_valid
  end
end
