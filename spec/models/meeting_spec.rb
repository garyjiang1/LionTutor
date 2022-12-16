require 'rails_helper'

RSpec.describe Meeting, type: :model do
  context 'validation tests' do
    it 'ensures title is present' do
      meeting = Meeting.new(description:'test').save
      expect(meeting).to eq(false)
    end

    it 'ensures description is present' do
      meeting = Meeting.new(title:'test').save
      expect(meeting).to eq(false)
    end

    it 'ensures start time is present' do
      meeting = Meeting.new(end_time:'test').save
      expect(meeting).to eq(false)
    end

    it 'ensures end time is present' do
      meeting = Meeting.new(start_time:'test').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting' do
      meeting = Meeting.new(title:'', description:'', start_time:'', end_time:'').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because title is empty' do
      meeting = Meeting.new(title:'', description:'x', start_time:'2022/11/16', end_time:'2022/11/16').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because description is empty' do
      meeting = Meeting.new(title:'x', description:'', start_time:'2022/11/16', end_time:'2022/11/16').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because start time is empty' do
      meeting = Meeting.new(title:'x', description:'x', start_time:'', end_time:'2022/11/16').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because end time is empty' do
      meeting = Meeting.new(title:'x', description:'x', start_time:'2022/11/16', end_time:'').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because meeting location is empty' do
      meeting = Meeting.new(title:'x', description:'x', start_time:'2022/11/16', end_time:'', meeting_online_link: 'www.google.com').save
      expect(meeting).to eq(false)
    end

    it 'should not successfully save a meeting because meeting online link is empty' do
      meeting = Meeting.new(title:'x', description:'x', start_time:'2022/11/16', end_time:'', meeting_location:'CSC411').save
      expect(meeting).to eq(false)
    end

    it 'should successfully save a meeting' do
      meeting = Meeting.new(title:'x', description:'w', start_time:'2022/11/16', end_time:'2022/11/17', meeting_location: 'Test', meeting_online_link: 'www.google.com', tutor_id: '1').save
      expect(meeting).to eq(true)
    end

    it 'should not successfully save a meeting' do
      meeting = Meeting.new(title:'x', description:'w', start_time:'2022/11/16', end_time:'2022/11/17', meeting_location: 'Test', meeting_online_link: 'www.google.com').save
      expect(meeting).to eq(false)
    end

  end
end