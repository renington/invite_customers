require 'intercom'

describe Intercom do 
    context 'when inviting customers within 100km from the office location' do
        it 'returns id and name of customers within 100km' do
            intercom_dublin = Intercom.new("Dublin", "53.339428", "-6.257664")
            expect { intercom_dublin.invite_customers_from_distance_and_txt 100.00, './fixtures/customers.txt' }.to output("12 Christina McArdle\n").to_stdout
        end
    end
end