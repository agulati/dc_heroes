file_name = File.join(Rails.root, "db", "seeds", "attributes.yml")
puts "File not found: #{file_name}" and return unless File.exists?(file_name)

Attribute.transaction do
  Attribute.delete_all

  rows = YAML.load_file(file_name)
  rows.each do |row|
    begin
      row = row.deep_symbolize_keys
      Attribute.create!(**row)
      puts "Created Attribute: #{row}"
    rescue => e
      puts "Failed to create Attribute: row - #{e.message}"
      puts e.backtrace
    end
  end
end
