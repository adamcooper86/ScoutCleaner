class Cleaner
  def self.clean_folder path
    dirty_folders = []
    Dir.glob(path + "/**").sort.each do |file|
      if File.directory?(file)
        self.clean_folder file
        dirty_folders << file
      else
        puts 'cleaning file' + file
        self.rename_file file, path
      end
    end

    self.rename_folders dirty_folders, path
    "Cleaned files in folder: " + path
  end
  def self.rename_folders folders, path
    folders.each{ |folder| self.rename_file folder, path }
  end
  def self.rename_file file, path
    filename = self.clean_file_name file
    filename = path + "/" + filename
    File.rename file, filename
  end
  def self.clean_file_name file
    extension = File.extname file
    base_name = File.basename file, extension
    base_name = self.clean_string base_name
    base_name + extension
  end
  def self.clean_string string = ""
    string.gsub /[^\w,\-]/, "_"
  end
end