
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []

  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def student_by_first_char(students)
  students.each do |student|
    letter = 'c'
    if student[:name][0] == letter
      puts "The students starting with " +letter + " are listed below"
      puts "#{student[:name]}"
    end
  end
end

def students_names_less_than_12_chars(students)
        puts "Students with short names (<12) are listed below"
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]}"
    end
  end
end


def print(students)
  i = 0
  until i == students.count
    puts "#{students[i][:name]} (#{student[i][:cohort]} cohort)"
    i = i + 1
  end
end


def print_index(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_index(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
