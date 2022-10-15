class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        elsif @passengers.length < @capacity
            return false
        end
   end

   def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
   end

   def list_passengers
        pass = []
        @passengers.each do |passenger|
            pass & passenger
        end
        pass
        p pass
   end


   def [](index_num)
        @passengers[index_num]
   end

   def <<(passenger)
        self.board_passenger(passenger)
   end
end