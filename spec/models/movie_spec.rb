require 'spec_helper'

describe Movie do
    describe 'searching by the same director' do
        it 'should find movies whose director matches that of the current movie' do
            fake_movie = mock('movie', :director => 'test director')
            Movie.should_receive(:find_by_id).with('1').and_return(fake_movie)
            fake_results = [mock('movie1'), mock('movie2')]
            Movie.should_receive(:find_all_by_director).with('test director').and_return(fake_results)
            Movie.find_by_the_same_director('1')
        end
        
        it 'should raise an NoDirectorError with no director in movie' do
            fake_movie = mock('movie', :director => '')
            Movie.should_receive(:find_by_id).with('1').and_return(fake_movie)
            lambda { Movie.find_by_the_same_director('1') }.should raise_error(Movie::NoDirectorError)
        end
    end
end
