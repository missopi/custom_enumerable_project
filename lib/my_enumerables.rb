# frozen_string_literal: true

# custom versions of enumerable methods
module Enumerable
  def my_each_with_index
    my_each { |value, index| yield(value, index) }
    self
  end

  def my_all?
    my_each { |value| return false unless yield value }
    true
  end

  def my_none?
    my_each { |value| return false if yield value }
    true
  end

  def my_any?
    my_each { |value| return true if yield value }
    false
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each { |value| count += 1 if yield value }
    count
  end

  def my_select
    new_array = []
    my_each { |value| new_array.push(value) if yield value }
    new_array
  end

  def my_map
    new_array = []
    my_each { |value| new_array.push(yield value) }
    new_array
  end

  def my_inject(sum = self[0])
    my_each { |value| sum = yield(sum, value) }
    sum
  end
end

# Methods defined in enumerable module have access to this method
class Array
  # custom version of each method
  def my_each
    for value in self
      yield value
    end
    self
  end
end
