class ScoutView
  def initialize
    welcome
  end
  def welcome
    puts "Thanks for using ScoutCleaner."
  end
  def get_path
    puts "Please enter the absolute file path for the folder you wish to be cleaned."
    puts "for example Users/John/Documents/essays"
    gets.chomp()
  end
  def message message
    puts message
  end
  def goodbye
    puts "Thanks for using ScoutCleaner. Making file names safe, Scout's Honor"
  end
end