require 'distance'

describe Distance do
    context 'when calculating the distance between the A and B points' do
        it 'returns the correct distance' do
            # 48.858327 2.294537 - Eiffel Tower
            # 53.427656 -6.244341 - Dublin Airport
            # Distance:	782 km
            expect( subject.distance("48.858327".to_f, "2.294537".to_f, "53.427656".to_f, "-6.244341".to_f).floor ).to eq(782)
        end     
    end
end