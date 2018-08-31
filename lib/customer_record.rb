require 'json'
require 'distance'
require 'customer'

class CustomerRecord
    @@customers = nil

    def read_from_txt(path)
        begin
            lines = File.open(path, 'r')
        rescue Exception => e  
            raise RuntimeError, "File not found"
        end

        @@customers = parse lines
    end

    def filter_by_distance(source_point, distance)
        d = Distance.new
        @@customers = @@customers.select { |customer| d.distance(customer.latitude, customer.longitude, source_point.latitude.to_f, source_point.longitude.to_f) <= distance.to_f }
    end

    def sort_by_id(order: "asc")
        if order == "asc"
            @@customers = @@customers.sort_by { |customer| customer.id }
        end
    end

    private 
    def parse(lines)
        lines.each_line.map do |line| 
            customer_array = JSON.parse(line) 
            Customer.new(
                customer_array["user_id"], 
                customer_array["name"],
                customer_array["latitude"],
                customer_array["longitude"],
            )
        end
    end
end