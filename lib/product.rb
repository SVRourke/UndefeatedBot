class Product
    attr_accessor :url, :title, :availability, :all
    @@all = Array.new()

    def initialize(seeds)
        seeds.each do |key, value|
            self.send("#{key}=", value)
        end
        puts "#{self.title} created availability: #{self.availability}"
        @@all << self
    end

    def self.all
        @@all
    end

    def self.any_available?
        @@all.select {|p| p.availability == true}
    end
end