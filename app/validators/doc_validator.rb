class DocValidator < ActiveModel::EachValidator
  CPF_VALIDATION_SUM_SEQUENCE = [10, 9, 8, 7, 6, 5, 4, 3, 2]

  def validate_each(record, attribute, value)

    if value.nil? || value.length != 11
      record.errors.add(attribute, 'Out of range or null')
    else

      # adicionado value como argumento
      cpf_numbers = parse_cpf_numbers(value)
      # adicionado value como argumento
      verification_numbers = parse_verification_numbers(value)

      first_verification_number_sum = calculate_first_verification_sum(cpf_numbers)
      first_verification_number = calculate_verification_number(first_verification_number_sum)

      second_verification_number_sum = calculate_second_verification_sum(cpf_numbers, first_verification_number)
      second_verification_number = calculate_verification_number(second_verification_number_sum)

      record.errors.add(attribute, :invalid) unless verification_numbers[0] == first_verification_number &&
          verification_numbers[1] == second_verification_number
    end
  end

  private

  # adicionado um novo argumento chamado cpf
  def parse_cpf_numbers(cpf)
    cpf_numbers = cpf.split('')
    cpf_numbers.slice(0, cpf_numbers.size - 2).map { |n| n.to_i }
  end

  # adicionado um novo argumento chamado cpf
  def parse_verification_numbers(cpf)
    cpf_numbers = cpf.split('')
    cpf_numbers.slice(cpf_numbers.size - 2, cpf_numbers.size).map { |n| n.to_i }
  end

  def calculate_first_verification_sum(cpf)
    sum = 0
    CPF_VALIDATION_SUM_SEQUENCE.each_with_index do |n, index|
      sum += n * cpf[index]
    end
    sum
  end

  def calculate_verification_number(sum)
    mod = sum % 11
    mod > 1 ? 11 - mod : 0
  end

  def calculate_second_verification_sum(cpf, first_verification_number)
    sum = 0
    CPF_VALIDATION_SUM_SEQUENCE.each_with_index do |n, index|
      if !cpf[index + 1].nil?
        sum += n * cpf[index + 1]
      else
        sum += n * first_verification_number
      end
    end
    sum
  end
end