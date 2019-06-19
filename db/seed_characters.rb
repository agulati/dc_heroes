file_name = File.join(Rails.root, "db", "seeds", "characters.yml")
puts "File not found: #{file_name}" and return unless File.exists?(file_name)

attribute_map = Attribute.all.each_with_object({}) { |a,m| m[a.abbreviation] = a }

Character.transaction do
  Character.delete_all

  rows = YAML.load_file(file_name)
  rows.each do |row|
    begin
      row = row.deep_symbolize_keys
      attrs = row.delete(:character_attributes)
      char = Character.new(**row)
      attrs.each do |a|
        char.character_attributes << CharacterAttribute.new(
          _attribute: attribute_map[a[:abbreviation]],
          value: a[:value]
        )
      end

      char.save!
      puts "Created Character: #{row}"
    rescue => e
      puts "Failed to create Character: row - #{e.message}"
      puts e.backtrace
    end
  end
end
