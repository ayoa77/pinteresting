
RSpec.describe Candidate, type: :model do
  let(:proper_cv)             { IO.read(Rails.root.join('spec', 'fixtures', 'amadi-cv.pdf')) }
  let(:good_candidate)        { Candidate.create(email: "aj@ajamadi.com", username: 'ajamadi', cv: proper_cv) }

  context 'status: '  do
    it 'accepts my candidacy' do
      hopes(good_candidate.status).to eq(‘new employee’)
    end
  end
end
