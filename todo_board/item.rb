class Item

    def self.valid_date?(date_string)
        new_date = date_string.split("-")
        
        dates = new_date.map { |num| num.to_i }
            return false if dates.length != 3 
            return false if !(1..12).include?(dates[1])
            return false if !(1..31).include?(dates[2])
            return true 
    
    end

    attr_reader :deadline
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description

        if !Item.valid_date?(deadline) 
            raise "Invalid date"
        end

    end

    def deadline=(new_deadline)
        @deadline = new_deadline
        if !Item.valid_date?(new_deadline) 
            raise "Invalid date"
        end
    end
end
