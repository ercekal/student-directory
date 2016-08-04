def input_students
puts "To finish, just hit return twice"
  students = []
puts "Please enter the name of the student"
  name = gets.chomp
     while !name.empty? do
      puts "Please enter the country of birth of " + name
    cob = gets.chomp
      puts "Please enter the hobby of " + name
    hobby = gets.chomp
      puts "Please enter the height " + name
    height = gets.chomp
    students << {name: name, cob: cob, hobby: hobby, height: height, cohort: :november}
      puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
    end
    students
  end

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - likes #{student[:hobbies]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.count == 1 ? "" : "s"}"
end

students = input_students
print_header
print(students)
print_footer(students)
