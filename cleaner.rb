class Cleaner
  def self.clean_folder path
    Dir.glob(path + "/**").sort.each do |file|
      if File.file?(file)
        self.rename_file file, path
      else
        puts file + " is a folder"
        self.clean_folder file
      end
    end
    "Cleaned files in folder: " + path
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