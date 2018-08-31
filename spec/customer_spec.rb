require 'customer_record'

describe CustomerRecord do
    let(:customers) { subject.read_from_txt('./fixtures/customers.txt') }
    
    context 'when CustomerRecord reads a valid json file' do
        let(:no_file) { subject.read_from_txt('./fixtures/not_found.txt') }

        it 'is a valid format' do
            expect( customers[0].fetch("user_id") ).to be_kind_of(Fixnum)
            expect( customers[0].fetch("name") ).to be_kind_of(String)
            expect( customers[0].fetch("latitude") ).to be_kind_of(String)
            expect( customers[0].fetch("longitude") ).to be_kind_of(String)
        end
        
        it 'should return an array' do
            expect( customers ).to be_a Array 
        end
        
        it 'is not found' do
            expect{ no_file }.to raise_error(RuntimeError, "File not found")
        end    
    end
    
    context 'when CustomerRecord finds customers' do
        it 'is valid customer' do
            expect( customers[0].fetch("user_id") ).to eq(12)
            expect( customers[0].fetch("name") ).to eq("Christina McArdle")
        end

        it 'more than one' do
            expect( customers.count ).to eq(2)
        end
    end

   
end