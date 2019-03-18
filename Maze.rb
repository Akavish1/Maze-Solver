class Maze
  
  attr_accessor :maze

  def initialize
    puts "Hello! Do you wish to challenge me? enter a file name if so!"
    puts "Note: text files only!"
    scan_file
    puts "Here is your maze:\n" 
    print_maze
  end

  #verifies that file exists, and returns file input if so
  def file_input
    loop do
      input = gets.chomp + ".txt"
      return input if File.file?(input)
      puts "File not found, try again"
    end
  end

  #scans the file into the @maze attribute
  def scan_file
    @maze = []
    File.open(file_input, "r").each_line {|l| @maze << l.chomp}
    @maze
  end

  def print_maze
    puts "\n---S == STARTING POINT | R == RUNNER | E == EXIT POINT | * == WALL---\n"
    puts @maze 
    puts
  end

  def find_point(point)
    @maze.each.with_index do |e1, i1|
      e1.each_char.with_index {|e2, i2| return [i1, i2] if @maze[i1][i2] == point}
    end
  end

  def [](position)
    @maze[position[0]][position[1]]
  end

  def []=(position, value)
    @maze[position[0]][position[1]] = value
  end

end



