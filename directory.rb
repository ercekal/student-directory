@students = [] # an empty array accessible to all methods

require "csv"
puts File.read(__FILE__)
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Print the source code"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Please enter the file name to be saved"
    filename_save = gets.chomp
    save_students(filename_save)
  when "4"
    puts "Please enter the file name to be loaded"
    filename_load = gets.chomp.to_s
    load_students(filename_load)
  when "5"
    puts File.read(__FILE__)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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

def save_students(filename_save)
  # open the file for writing
  CSV.open(filename_save, "wb") do |csv|
  # iterate over the array of students
  @students.each {|student| csv << [student[:name], student[:cohort]] }
    end
  puts "Students are saved to " + filename_save
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) {|row|
    name, cohort = row
    @students << {name: name, cohort: :november}
  }
  puts "Loaded #{@students.count} students from #{filename}"
end

def try_load_students(filename = "students.csv")
  if ARGV.first.nil?# first argument from the command line
  load_students(filename)
else
  filename = ARGV.first
if File.exists?(filename)
  load_students(filename)
   puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
end

try_load_students
interactive_menu
