require 'json'

class CustomerRecord
    def read_from_txt(path)
        begin
            lines = File.open(path, 'r')
        rescue Exception => e  
            raise RuntimeError, "File not found"
        end
        
        lines.each_line.map do |line| 
            JSON.parse(line) 
        end
    end
end