action_table = Table.create!(
  type:     "action",
  x_label:  "Opposing Values",
  y_label:  "Acting Values"
)

values = [
  80, 75, 70, 65, 60, 55, 50, 45, 40, 36, 32,
  28, 24, 21, 18, 15, 13, 11, 9, 7, 5, 4, 3,
]

zero_opposing_values = [
  6, 5, 4, 4, 3, 3, 3, 3, 3,
  3, 3, 3, 3, 3, 3, 3, 3, 3,
]

acting_ranges = [
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

opposing_ranges = [
  { min: 56, max: 60 },
  { min: 51, max: 55 },
  { min: 46, max: 50 },
  { min: 41, max: 45 },
  { min: 36, max: 40 },
  { min: 31, max: 35 },
  { min: 28, max: 30 },
  { min: 25, max: 27 },
  { min: 22, max: 24 },
  { min: 19, max: 21 },
  { min: 16, max: 18 },
  { min: 13, max: 15 },
  { min: 11, max: 12 },
  { min: 9,  max: 10 },
  { min: 7,  max: 8  },
  { min: 5,  max: 6  },
  { min: 3,  max: 4  },
  { min: 1,  max: 2  },
  { min: 0,  max: 0  },
]

opposing_ranges.each_with_index do |opposing, col|
  acting_ranges.each_with_index do |acting, row|
    action_table.table_nodes << TableNode.new(
      x_index:  opposing_ranges.length - col,
      y_index:  row + 1,
      x_max:    opposing[:max],
      x_min:    opposing[:min],
      y_max:    acting[:max],
      y_min:    acting[:min],
      value:    opposing[:min] == 0 ? zero_opposing_values[row] : values[col+row] || 3
    )
  end
end

action_table.save!
puts "Created Action Table"
