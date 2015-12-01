class Cleaner
  def self.clean_folder path
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