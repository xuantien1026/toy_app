require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) do
        @user1 = build(:user)
    end

    it 'is valid with valid attributes' do
        user2 = build(:user, email: 'example@mail.com')
        expect(user2).to be_valid
    end

    it 'must have a name' do
        user2 = build(:user, name: nil)
        expect(user2).to_not be_valid
    end

    it 'must have an email' do
        user2 = build(:user, email: nil)
        expect(user2).to_not be_valid
    end

    it 'cannot have a name longer than 50 characters' do
        user2 = build(:user, name: 'a' * 51)
        expect(user2).to_not be_valid
    end

    it 'cannot have an email longer than 255 characters' do
        user2 = build(:user, email: "a" * 244 + '@example.com')
        expect(user2).to_not be_valid
    end

    it 'should accept valid email addresses' do
        valid_addresses = %w[user@example.com USER@foo.com
                            A_US-ER@foo.bar.org
                            first.last@foo.jp
                            alice+bob@bar.cn]
        valid_addresses.each do |valid_address|
            user2 = build(:user, email: valid_address)
            expect(user2).to be_valid
        end
    end

    it 'has a unique email' do
        user2 = build(:user, name: 'XT')
        expect(user2).to_not be_valid
    end

    it 'should have its email saved in lowercase' do
        user2 = create(:user, name: 'XT', email: 'SamPle@ExAmPle.com', password: 'blahblah')
        expect(user2.email.downcase).to eql(user2.reload.email)
    end

    it 'must have a password' do
        user2 = build(:user, password: nil)
        expect(user2).to_not be_valid
    end
end