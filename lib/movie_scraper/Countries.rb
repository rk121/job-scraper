class Countries
    attr_accessor :country_code, :country

    @@all = []

    def initialize(country_code, country)
        @country_code = country_code
        @country = country
        @@all << self
    end

    def self.all
        @@all
    end
end