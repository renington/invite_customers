require 'customer_record'

# There is a DataMapper, but I want to use Active Record approach
describe CustomerRecord do
    let(:customers) { subject.read_from_txt('./fixtures/customers.txt') }
    
    context 'when reading a valid json file' do
        it 'returns an array' do
            expect( customers ).to be_a Array 
        end
        
        it 'returns customers' do
            expect( customers.first ).to be_a Customer
        end
    end
    
    context 'when it not found a file' do
        let(:no_file) { subject.read_from_txt('./fixtures/not_found.txt') }

        it 'responds with raise not found' do
            expect{ no_file }.to raise_error(RuntimeError, "File not found")
        end
    end

    context 'when reading an invalid format' do
        let(:invalid_format) { subject.read_from_txt('./fixtures/invalid_format.txt') }

        it 'responds with raise invalid format' do
            expect{ invalid_format }.to raise_error(RuntimeError, "Invalid format")
        end
    end
    
    context 'when finding 2 customers' do
        it 'returns 2 customers' do
            expect( customers.count ).to eq(2)
        end
    end

    context 'when sorting results' do
        it 'returns customers list order by ASC' do
            customers = subject.sort_by_id
            expect( customers.first.id ).to eq(1)
            expect( customers.last.id ).to eq(12)
        end
    end

    context 'when filtering results within 100km' do
        it 'returns customers within 100km' do
            intercom_dublin = double('Intercom')
            allow(intercom_dublin).to receive_messages(latitude: "53.339428", longitude: "-6.257664")
            expect( subject.filter_by_distance(intercom_dublin, 100.00).count ).to eq(1)
        end
    end
end