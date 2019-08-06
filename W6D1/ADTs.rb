class Stack
    def initialize
      @storage_array = []
    end

    def push(el)
      storage_array.push(el)
    end

    def pop
      storage_array.pop
    end

    def peek
      storage_array.last
    end

    private

    attr_accessor :storage_array
  end


  class Queue
    def initialize
      @the_queue = []
    end

    def enqueue(el)
      the_queue.push(el)
    end

    def dequeue
      the_queue.shift
    end

    def peek
      the_queue.first 
    end

    private

    attr_accessor :the_queue
  end

  class Map
    def initialize
      @mapped_array = []
    end

    def set(key, value)
      pair_index = mapped_array.index { |pair| pair[0] == key }
      if pair_index
        mapped_array[pair_index][1] = value
      else
        mapped_array.push([key, value])
      end
      value
    end

    def get(key)
      mapped_array.each do |pair| 
        return pair[1] if pair[0] == key
      end
      nil
    end

    def delete(key)
      val = get(key)
      mapped_array.reject! { |pair| pair[0] == key }
      val
    end

    def show
      deep_dup(mapped_array)
    end

    def deep_dup(arr)
      arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end  

    private

    attr_accessor :mapped_array
  end