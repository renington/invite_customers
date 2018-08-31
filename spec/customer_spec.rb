require 'customer_record'

# There is a DataMapper, but I want to use Active Record approach
describe CustomerRecord do
    let(:customers) { subject.read_from_txt('./fixtures/customers.txt') }
    
    context 'when the CustomerRecord reads a valid json file' do
        let(:no_file) { subject.read_from_txt('./fixtures/not_found.txt') }

        # Maybe create another class for that, like Reader.
        # it 'is a valid format' do
        #     expect( customers.first.fetch("user_id") ).to be_kind_of(Fixnum)
        #     expect( customers.first.fetch("name") ).to be_kind_of(String)
        #     expect( customers.first.fetch("latitude") ).to be_kind_of(String)
        #     expect( customers.first.fetch("longitude") ).to be_kind_of(String)
        # end
        
        it 'should return an array' do
            expect( customers ).to be_a Array 
        end

        it 'should return a Customer' do
            expect( customers.first ).to be_a Customer
        end
        
        it 'is not found' do
            expect{ no_file }.to raise_error(RuntimeError, "File not found")
        end
    end
    
    context 'when the CustomerRecord found customers' do
        it 'is valid customer' do
            expect( customers.first.id ).to eq(12)
            expect( customers.first.name ).to eq("Christina McArdle")
        end

        it 'greater than one' do
            expect( customers.count ).to eq(2)
        end
    end

    context 'when sorting results' do
        it 'is ASC default' do
            customers = subject.sort_by_id
            expect( customers.first.id ).to eq(1)
            expect( customers.last.id ).to eq(12)
        end
    end

    context 'filter results' do
        it 'within 100km' do
            intercom_dublin = double('Intercom')
            allow(intercom_dublin).to receive_messages(latitude: "53.339428", longitude: "-6.257664")
            expect( subject.filter_by_distance(intercom_dublin, 100.00).count ).to eq(1)
        end
    end
end