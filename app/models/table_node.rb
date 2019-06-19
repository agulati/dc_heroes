class TableNode < ApplicationRecord

  RESULT_A      = -2
  RESULT_PLUS_1 = -3
  RESULT_N      = -4

  belongs_to :table
end
