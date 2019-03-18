class Maze
  
  attr_accessor :maze

  #verifies that file exists, and returns file input if so
  def file_input
    loop do
      input = gets.chomp + ".txt"
      return input if input.is_a?(File)
      puts "File not found, try again"
    end
  end

  #scans the file into the @maze attribute
  def scan_file
    file_input.each_line {|l| @maze += l}
    @maze
  end

  def initialize
    puts "Hello! Do you wish to challenge me? enter a file name if so!"
    puts "Note: text files only!"
    scan_file
  end

end

maze = Maze.new
p maze.maze
