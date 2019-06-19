class Table < ApplicationRecord
  self.inheritance_column = nil

  has_many :table_nodes
  accepts_nested_attributes_for :table_nodes, allow_destroy: true

  def get_node_for_values(x:, y:)
    table_nodes
      .where("x_min >= :x and x_max <= :x and y_min >= :y and y_max <= :y", { x: x, y: y })
      .first
  end

  def get_node_for_index(x:, y:)
    table_nodes
      .where("x_index = :x and y_index = :y", { x: x, y: y })
      .first
  end
end
