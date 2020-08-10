Puppet::Functions.create_function(:'random') do
    dispatch :random do
      param 'Array', :arr
    end

    def random(arr)
        arr.sample
    end
  end