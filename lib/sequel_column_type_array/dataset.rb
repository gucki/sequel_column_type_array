module Sequel
  class Dataset
    def literal_array(v)
      case v
        when IntegerColumnArray
          literal_string("{#{v*","}}")
        when StringColumnArray
          literal_string("{#{v.to_csv.strip}}")
        else
          Sequel.condition_specifier?(v) ? literal_expression(SQL::BooleanExpression.from_value_pairs(v)) : array_sql(v)
      end
    end
  end
end
