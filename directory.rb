def input_students
puts "To finish, just hit return twice"
  students = []
  def_cohort = :november
puts "Please enter the name of the student"
  name = gets.gsub(/\n/,"")
     while !name.empty? do
       puts "Please enter the cohort of " + name
       cohort_input = gets.chomp
       cohort = (cohort_input == "" ? def_cohort : cohort_input.downcase.to_sym)
    students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
      puts "Please enter the name of the student"
    name = gets.gsub(/\n/,"")
    end
    students
  end

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - likes #{student[:hobbies]}".center(60)
  end
end

def sort_by_cohort(students)
  studenti = students.sort_by do |i|
    i = [:cohort]
end
puts studenti
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.count == 1 ? "" : "s"}"
end


students = input_students
print_header
print(students)
print_footer(students)
#sort_by_cohort(students)
