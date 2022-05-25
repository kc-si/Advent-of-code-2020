def read_file
  puts('Type the filename with data:')
  input_file = gets
  input_file.chop!

  if File.readable?(input_file)
    data = File.read(input_file)
  end
  data
end

def parse_data(input_file)
  input_file.split("\n")
end

def select_valid_passwords(data)
  data.select { |data_set| password_valid?(data_set) }
end

def password_valid?(data_set)
  data_set = data_set.split
  range = data_set[0].split('-')
  range.map!(&:to_i)
  must_contain = data_set[1].chop
  password = data_set[2]
  password.scan(must_contain).size.between?(range[0], range[1])
end

def count_valid_passwords(input_file)
  data = parse_data(input_file)
  valid_passwords = select_valid_passwords(data)
  valid_passwords.size
end

if __FILE__ == $PROGRAM_NAME

  data = read_file

  valid_passwords_count = count_valid_passwords(data)

  puts("In the database is #{valid_passwords_count} valid passwords.")
end
