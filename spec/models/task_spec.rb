require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.create!(title: 'Title', details: 'Too many words in these details') }

  describe '#initialize' do
    context 'when correct params are given' do
      it "creates a Task instance" do
        expect(task.title).to eq('Title')
      end
    end

    context 'when it is not given a title' do
      before { task.title = nil }

      it "does not give a valid task" do
        expect(task.valid?).to eq(false)
      end

      it "returns an error message" do
        task.valid?
        expect(task.errors.messages).to eq({ title: ["can't be blank"] })
      end
    end
  end

  describe '#truncate_details' do
    it "should truncate task's details to 15 chars" do
      expect(task.truncate_details).to eq("Too many words i...")
    end
  end
end
