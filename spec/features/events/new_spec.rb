require 'rails_helper'

RSpec.describe 'create a new event' do
  before :each do
    @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    @party = @user.events.create(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
    @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @party_1 =  Event.create(title: 'Harry Potter and The Goblet of Fire', date: "2021-10-11", time: '9:00:00', runtime: 120, user_id: @user_1.id)
    @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
    @attendee =  Attendee.create(user_id:@user_1.id, event_id:@party.id)
    @attendee_1 = Attendee.create(user_id:@user.id, event_id:@party_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit new_event_path
  end

  it 'has a form to create a new viewing party' do
    expect(page).to have_field(:duration)
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)
    expect(page).to have_unchecked_field()
  end
end
