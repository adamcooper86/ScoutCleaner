require_relative 'cleaner'
require_relative 'scout_view'

class ScoutCleanerController
  def initialize path_info
    @view = ScoutView.new
    if path_info
      path = path_info
    else
      path = @view.get_path
    end
    @view.message(Cleaner.clean_folder path)
    @view.goodbye
  end
end

path_info = ARGV[0]

start = Time.now
ScoutCleanerController.new path_info
finish = Time.now

puts "Time for 100 renames: "
puts finish - start