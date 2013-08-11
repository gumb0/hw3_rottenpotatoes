require 'spec_helper'

describe MoviesController do
    describe 'searching by director' do
        it 'should call a model method that performs search by director' do
            fake_results = [mock('movie1'), mock('movie2')]
            Movie.should_receive(:find_by_the_same_director).with('1').and_return(fake_results)
            post :search_by_director, {:id => 1}
        end
        
    end
end
