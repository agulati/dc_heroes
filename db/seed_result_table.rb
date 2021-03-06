result_table = Table.create!(
  type:     "result",
  x_label:  "Resistance Values",
  y_label:  "Effect Values"
)

effect_ranges = [
  { min: 1,  max: 2  },
  { min: 3,  max: 4  },
  { min: 5,  max: 6  },
  { min: 7,  max: 8  },
  { min: 9,  max: 10 },
  { min: 11, max: 12 },
  { min: 13, max: 15 },
  { min: 16, max: 18 },
  { min: 19, max: 21 },
  { min: 22, max: 24 },
  { min: 25, max: 27 },
  { min: 28, max: 30 },
  { min: 31, max: 35 },
  { min: 36, max: 40 },
  { min: 41, max: 45 },
  { min: 46, max: 50 },
  { min: 51, max: 55 },
  { min: 56, max: 60 },
]

resistance_ranges = [
  { min: 0,  max: 0  },
  { min: 1,  max: 2  },
  { min: 3,  max: 4  },
  { min: 5,  max: 6  },
  { min: 7,  max: 8  },
  { min: 9,  max: 10 },
  { min: 11, max: 12 },
  { min: 13, max: 15 },
  { min: 16, max: 18 },
  { min: 19, max: 21 },
  { min: 22, max: 24 },
  { min: 25, max: 27 },
  { min: 28, max: 30 },
  { min: 31, max: 35 },
  { min: 36, max: 40 },
  { min: 41, max: 45 },
  { min: 46, max: 50 },
  { min: 51, max: 55 },
  { min: 56, max: 60 },
]

node_values = {
  y_0_0:    Array.new(18, TableNode::RESULT_A),
  y_1_2:    [ 1, 2, 3, 5, 8, 10, 12, 14, 18, 21, 24, 27, 30, 35, 40, 45, 50, 55 ],
  y_3_4:    [ TableNode::RESULT_N, 1, 2, 4, 6, 9, 11, 13, 17, 20, 23, 26, 29, 34, 38, 43, 48, 53 ],
  y_5_6:    Array.new(2,  TableNode::RESULT_N) + [ 1, 3, 4, 7, 9, 11, 16, 19, 22, 25, 28, 33, 36, 41, 46, 51 ],
  y_7_8:    Array.new(3,  TableNode::RESULT_N) + [ 2, 3, 6, 8, 10, 14, 17, 20, 23, 26, 31, 34, 40, 44, 49 ],
  y_9_10:   Array.new(4,  TableNode::RESULT_N) + [ 2, 4, 7, 9, 12, 15, 18, 21, 24, 29, 32, 38, 42, 47 ],
  y_11_12:  Array.new(5,  TableNode::RESULT_N) + [ 3, 5, 8, 10, 13, 16, 19, 22, 27, 30, 36, 40, 45 ],
  y_13_15:  Array.new(6,  TableNode::RESULT_N) + [ 3, 6, 8, 11, 14, 17, 20, 25, 28, 34, 38, 43 ],
  y_16_18:  Array.new(7,  TableNode::RESULT_N) + [ 4, 6, 9, 12, 15, 18, 23, 26, 31, 36, 41 ],
  y_19_21:  Array.new(8,  TableNode::RESULT_N) + [ 4, 7, 10, 13, 16, 21, 24, 28, 34, 39 ],
  y_22_24:  Array.new(9,  TableNode::RESULT_N) + [ 5, 8, 11, 14, 19, 22, 26, 32, 36 ],
  y_25_27:  Array.new(10, TableNode::RESULT_N) + [ 6, 9, 12, 17, 20, 24, 30, 33 ],
  y_28_30:  Array.new(11, TableNode::RESULT_N) + [ 7, 10, 14, 18, 22, 27, 30 ],
  y_31_35:  Array.new(12, TableNode::RESULT_N) + [ 8, 12, 16, 20, 24, 27 ],
  y_36_40:  Array.new(13, TableNode::RESULT_N) + [ 9, 13, 17, 21, 24 ],
  y_41_45:  Array.new(14, TableNode::RESULT_N) + [ 10, 14, 18, 21 ],
  y_46_50:  Array.new(15, TableNode::RESULT_N) + [ 11, 15, 18 ],
  y_51_55:  Array.new(16, TableNode::RESULT_N) + [ 12, 15 ],
  y_56_60:  Array.new(17, TableNode::RESULT_N) + [ 13 ],
}

resistance_ranges.each_with_index do |resistance, col|
  effect_ranges.each_with_index do |effect, row|
    result_table.table_nodes << TableNode.new(
      x_index:  col + 1,
      y_index:  row + 1,
      x_max:    resistance[:max],
      x_min:    resistance[:min],
      y_max:    effect[:max],
      y_min:    effect[:min],
      value:    node_values["y_#{resistance[:min]}_#{resistance[:max]}".to_sym][row]
    )
  end
end

result_table.save!
puts "Created Result Table"
