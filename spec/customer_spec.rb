require 'customer'

describe Customer do
    context 'when instantiating' do
        it 'returns a valid Customer' do
            customer = Customer.new(1,"Renington Fuller", "-15.839017", "-48.024247")
            expect(customer.id).to be_kind_of(Fixnum)
            expect(customer.name).to be_kind_of(String)
            expect(customer.latitude).to be_kind_of(Float)
            expect(customer.longitude).to be_kind_of(Float)
        end
    end
end