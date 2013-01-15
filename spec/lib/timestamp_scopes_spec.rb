require 'spec_helper'

class Post < ActiveRecord::Base
end

describe 'timestamp_scopes' do

  it 'should be version "0.0.1"' do
    expect(TimestampScopes::VERSION).to eq "0.0.1"
  end

  describe '.add_timestamp_scopes' do

    context 'without arguments' do
      it 'should add both the .created and .updated scope' do
        Post.add_timestamp_scopes
        expect(Post.created(nil)).to be_a ActiveRecord::Relation
        expect(Post.updated(nil)).to be_a ActiveRecord::Relation
      end
    end

    context 'when given a list of symbols' do
      before(:all) { Post.add_timestamp_scopes :posted }

      it 'should add one scope per symbol' do
        expect(Post.posted(nil)).to be_a ActiveRecord::Relation
      end

      context 'and the created scope' do
        it 'should use the _at suffix for the column' do
          expect(Post.posted(after: 'x').where_values).to eq(
            Post.where('posted_at > ?', 'x').where_values
          )
        end
      end
    end

    describe 'a scope added by timestamp scopes' do

      before(:all) do
        Post.add_timestamp_scopes :created
      end

      let(:time) { Time.now }

      describe ':after option' do
        it 'should add a created_at > ? constraint' do
          expect(Post.created(after: time).where_values).to eq(
                 Post.where('created_at > ?', time).where_values
          )
        end
      end

      describe ':before option' do
        it 'should add a created_at < ? constraint' do
          expect(Post.created(before: time).where_values).to eq(
                 Post.where('created_at < ?', time).where_values
          )
        end
      end
    end
  end

end
