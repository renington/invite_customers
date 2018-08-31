class Customer
    attr_reader :id, :name, :latitude, :longitude
  
    def initialize(id, name, latitude, longitude)
      @id = id
      @name = name
      @latitude = latitude.to_f
      @longitude = longitude.to_f
    end
end