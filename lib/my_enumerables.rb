module Enumerable
  # Your code goes here
  def my_each_with_index
    number = 0
    self.each do |element|
        yield(element,number)
        number += 1
    end
  end

  def my_select
    array = []
    self.each do |element|
        if yield(element)
            array << element
        end
    end
    return array
  end

  def my_all?
    self.each do |element|
        return false unless yield(element)
    end

    return true
  end

  def my_any?
    self.each do |element|
        return true if yield(element)
    end

    return false
  end   

  def my_none?
    self.each do |element|
        return false if yield(element)
    end

    return true
  end

  def my_count
    count = 0
    return self.size unless block_given?
    self.each do |element|
        count += 1 if yield(element)
    end

    return count
  end

  def my_map
    array = []
    self.each do |element|
        array << yield(element)
    end

    return array
  end

  def my_inject(initial_value)
    self.each do |element|
       initial_value = yield(initial_value, element)
    end

    return initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    #return self.to_enum unless block_given?
    self.each do |x|
        yield(x)
    end
  end
end
