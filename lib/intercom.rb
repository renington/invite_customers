require 'customer_record'

class Intercom
    attr_reader :office, :latitude, :longitude

    def initialize(office, latitude, longitude)
        @office = office
        @latitude = latitude
        @longitude = longitude
    end

    def invite_customers_from_distance_and_txt(distance, file_path)
        customer_record = CustomerRecord.new
        customer_record.read_from_txt(file_path)
        customer_record.filter_by_distance(self, distance)
        customers = customer_record.sort_by_id
        customers.each { |customer| puts "#{customer.id} #{customer.name}" }
    end
end