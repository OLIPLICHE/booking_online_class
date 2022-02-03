equire 'rails_helper'

RSpec.describe Course, type: :model do
  let(:user) { User.create(name: 'Paka', email: 'example@mail.com', password: 'mypassword') }
  let(:course) { Course.create(user_id: user.id, title: 'Ruby on Rails module', picture: 'logo.png', city: 'Yakto', country: 'France', short_description: 'lala lallal', description: 'Zoz zoz ozoz', language: 'french', level: 'Beginner',
  price: '100', date_start: '2015-01-9', date_end: '2015-01-10') }

  describe 'Validations' do
    context 'when valid' do
      it { expect(course).to be_valid }
    end
  end
end
