require './lib/task_002'

RSpec.describe 'count_valid_passwords(input_data)' do
  it 'count how many passwords are valid' do
    input_data = <<~INPUT
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    INPUT

    valid_passwords_count = count_valid_passwords(input_data)

    expect(valid_passwords_count).to eq(2)
  end
end
