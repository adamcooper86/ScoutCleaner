class Cleaner
  def self.clean_folder path
    dirty_folders = []

    Dir.glob(path + "/**").sort.each do |file|
      if File.directory?(file)
        self.clean_folder file
        dirty_folders << file
      else
        self.rename_file file, path, 128
      end
    end

    self.rename_folders dirty_folders, path

    "Cleaned files in folder: " + path
  end
  def self.rename_folders folders, path
    folders.each do |folder|
      self.rename_file folder, path, 250
    end
  end
  def self.rename_file file, path, length
    filename = self.clean_file_name file, length
    filename = path + "/" + filename
    File.rename file, filename
    filename
  end
  def self.clean_file_name file, length
    extension = File.extname file
    base_name = File.basename file, extension
    base_name = self.clean_string base_name
    if base_name.length > length
      base_name = base_name.slice(0..(length-1))
    end
    base_name + extension
  end
  def self.clean_string string = ""
    string.gsub /[^\w,\-]/, "_"
  end
end