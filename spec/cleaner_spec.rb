require 'spec_helper'

describe Cleaner do
  let(:longname){ "onetwothree" * 100 }
  let(:long_file_name){ longname + ".txt" }
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
      expect(Cleaner.clean_file_name "hello.txt", 128).to eq "hello.txt"
    end
    it 'returns a valid file name if given an invalid string' do
      expect(Cleaner.clean_file_name "hello hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello  hello.txt", 128).to eq "hello__hello.txt"
      expect(Cleaner.clean_file_name 'hello\hello.txt', 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello/hello.txt", 128).to eq "hello.txt"
      expect(Cleaner.clean_file_name "hello:hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello*hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello?hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name 'hello"hello.txt', 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello<hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello>hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello|hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello#hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello%hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello~hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello&hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello}hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello{hello.txt", 128).to eq "hello_hello.txt"
      expect(Cleaner.clean_file_name "hello;hello.txt", 128).to eq "hello_hello.txt"
    end
    it 'returns a valid folder name if given an invalid string' do
      expect(Cleaner.clean_file_name "hello hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello  hello", 128).to eq "hello__hello"
      expect(Cleaner.clean_file_name 'hello\hello', 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello/hello", 128).to eq "hello"
      expect(Cleaner.clean_file_name "hello:hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello*hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello?hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name 'hello"hello', 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello<hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello>hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello|hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello#hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello%hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello~hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello&hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello}hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello{hello", 128).to eq "hello_hello"
      expect(Cleaner.clean_file_name "hello;hello", 128).to eq "hello_hello"
    end
    it 'returns a valid length name when given a long file name' do
      expect(Cleaner.clean_file_name(long_file_name, 128).length).to eq 132
    end
    it 'returns a valid length folder name when given a long folder name' do
      expect(Cleaner.clean_file_name(longname, 250).length).to eq 250
    end
  end
  context ".clean_folder" do
    it 'returns true when completed' do
      expect(Cleaner.clean_folder File.absolute_path("files")).to be_truthy
    end
  end
end