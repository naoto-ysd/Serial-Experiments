RSpec.describe 'Post' do
  context 'before publication' do
    it 'cannot have comments' do
      expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end