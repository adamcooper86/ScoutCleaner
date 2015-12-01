require 'spec_helper'

describe Cleaner do
  context ".clean_string" do
    it 'returns an empty string when passed no arguement' do
      expect(Cleaner.clean_string).to eq ""
    end
    it 'returns a the same string when no special characters are present' do
      expect(Cleaner.clean_string "apple").to eq "apple"
      expect(Cleaner.clean_string "apple_sause").to eq "apple_sause"
    end
    it 'returns a string with spaces replaced' do
      expect(Cleaner.clean_string "apple sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple  sause").to eq "apple__sause"
      expect(Cleaner.clean_string 'ap\ple sause').to eq "ap_ple_sause"
      expect(Cleaner.clean_string "apple/ sause").to eq "apple__sause"
      expect(Cleaner.clean_string "apple:sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple*sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple?sause").to eq "apple_sause"
      expect(Cleaner.clean_string 'apple"sause').to eq "apple_sause"
      expect(Cleaner.clean_string "apple<sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple>sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple|sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple#sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple%sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple~sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple&sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple}sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple;sause").to eq "apple_sause"
      expect(Cleaner.clean_string "apple{sause").to eq "apple_sause"
    end
  end
  context ".clean_file_name" do
    it 'returns the same file if not given a valid file' do
      expect(Cleaner.clean_file_name "hello.txt").to eq "hello.txt"
    end
    it 'returns a valid file name if given an invalid string' do
      expect(Cleaner.clean_file_name "hello hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello  hello.txt").to eq "hello__hello.txt"
      expect(Cleaner.clean_file_name 'hello\hello.txt').to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello/hello.txt").to eq "hello.txt"
      expect(Cleaner.clean_file_name "hello:hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello*hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello?hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name 'hello"hello.txt').to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello<hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello>hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello|hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello#hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello%hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello~hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello&hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello}hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello{hello.txt").to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello;hello.txt").to eq "hello_hello.txt"
    end
  end
  context ".clean_folder" do
    it 'returns true when completed' do
      expect(Cleaner.clean_folder File.absolute_path("files")).to be_truthy
    end
  end
end