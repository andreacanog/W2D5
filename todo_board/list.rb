require './item.rb'
class List

    attr_accessor :label

    def initialize(label)
        @label = label 
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline) 
        if @items << Item.new(title, deadline, description)
            return true 
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if self.size > index && index >=0
            return true
        else
            return false
        end
    end

    def swap(index_1, index_2)
        if !self.valid_index?(index_1) || !self.valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        end
    end

    def [](index)
        if !self.valid_index?(index)
            return nil 
        else 
            return @items[index]
        end
    end

    def priority 
        @items[0]
    end

    def print
        puts "-----------------------------------------"
        puts "                " + self.label.upcase
        puts "-----------------------------------------"
        puts "#{'Index'.ljust(5)} | #{'Item'.ljust(20)} | #{'Deadline'.ljust(10)}"
        puts "-----------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline.ljust(10)}"
        end
        puts "-----------------------------------------"
    end

    def print_full_item(index)
        if !self[index].nil?
        puts "----------------------------------------"
        puts "#{@items.title.ljust(10)}#{item.deadline.ljust(1)}"
        puts item.description
        puts "----------------------------------------"
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !self.valid_index?(index)

        i = 0 
        while i < amount 
            self.swap(index[i], index_2[i - 1])
        

    end 

    def down(index, amount = 1)
        return false if !self.valid_index?(index)
    end









    # def up(index, amount = 1)
    #     return false if !valid_index?(index)
    #     while amount > 0 && index != 0
    #         swap(index, index - 1)
    #         index -= 1
    #         amount -= 1
    #     end
    #     true
    # end

    # def down(index, amount = 1)
    #     return false if !valid_index?(index)
    #     while amount > 0 && index != size - 1
    #         swap(index, index + 1)
    #         index += 1
    #         amount -= 1
    #     end
    #     true
    # end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end