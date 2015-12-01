class Cleaner
  def self.clean_folder path
    dirty_folders = []

    Dir.glob(path + "/**").sort.each do |file|
      if File.directory?(file)
        self.clean_folder file
        dirty_folders << file
      else
        new_file = self.rename_file file, path
        self.cut_file_name(new_file, path) if new_file.length > 128
      end
    end

    self.rename_folders dirty_folders, path

    "Cleaned files in folder: " + path
  end
  def self.rename_folders folders, path
    folders.each do |folder|
      new_folder = self.rename_file folder, path
      self.cut_file_name(new_folder, path) if new_folder.length > 250
    end
  end
  def self.cut_file_name file, path
    extension = File.extname file
    base_name = File.basename file, extension
    base_name = base_name.slice(0..127)
    filename = base_name + extension
    filename = path + "/" + filename
    File.rename file, filename
  end
  def self.rename_file file, path
    filename = self.clean_file_name file
    filename = path + "/" + filename
    File.rename file, filename
    filename
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