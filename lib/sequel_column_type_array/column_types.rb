module Sequel

  class ColumnArray < Array
    def normalize(data)
      case data
        when String
          csv = data[1..-2]
          csv.blank? ? [] : csv.parse_csv
        when Array
          data
        else
          raise ArgumentError, "unsupported input #{data}"
      end
    end
  end

  class IntegerColumnArray < ColumnArray
    def initialize(data)
      super(normalize(data).map{ |v| v.to_i })
    end
  end

  class StringColumnArray < ColumnArray
    def initialize(data)
      super(normalize(data))
    end
  end
end

