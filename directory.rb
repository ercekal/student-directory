@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  cohort = :november
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    input_load(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def input_load(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
  end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def selection_succesfull
puts "You selection was done succesfully"
end

def process(selection)
  hash = { "1" => input_students,
    "2" => show_students,
    "3" => save_students,
    "4" => load_students,
    "9" => exit } #exits the program
  hash.default =  "I don't know what you meant, try again"
  hash(selection)
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    input_load(name, cohort)
  end
  file.close
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
