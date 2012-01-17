require "sequel/adapters/postgres"

module Sequel
  module Postgres
    PG_TYPES[1007] = lambda{ |s| IntegerColumnArray.new(s) } # integer[]
    PG_TYPES[1014] = lambda{ |s| StringColumnArray.new(s) } # character[]
    PG_TYPES[1015] = PG_TYPES[1014] # character varying[]

    class Dataset < Sequel::Dataset
      def literal_array_append(sql, v)
        sql << literal_array(v)
      end
    end

    module DatabaseMethods
      def schema_column_type(db_type)
        type = super(db_type)
        if db_type =~ /\[\]$/
          type = "#{type}_array".to_sym
        end
        type
      end

      def typecast_value_integer_array(value)
        IntegerColumnArray.new(value)
      end

      def typecast_value_string_array(value)
        StringColumnArray.new(value)
      end
    end
  end
end
