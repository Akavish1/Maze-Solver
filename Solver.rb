require_relative "Maze"

class Solver

  def initialize
    @maze = Maze.new
    @starting_position = @maze.find_point("S")
    @ending_position = @maze.find_point("E")
    @current_position = @starting_position
    @times_visited = Hash.new(0) #used instead of a stack/queue
  end

  def move
    while @current_position != @ending_position
      @times_visited[@current_position] += 1
      where_to
    end
  end

  def where_to
    to_up = move_up
    if valid_move?(to_up)
      @current_position = to_up
      return
    end
    to_right = move_right
    if valid_move?(to_right)
      @current_position = to_right
      return
    end
    to_down = move_down
    if valid_move?(to_down)
      @current_position = to_down
      return
    end
    to_left = move_left
    if valid_move?(to_left)
      @current_position = to_left
      return
    end
  end


  def move_up
    return [@current_position[0] - 1, @current_position[1]] 
  end

  def move_down
    return [@current_position[0] + 1, @current_position[1]] 
  end

  def move_right
    return [@current_position[0], @current_position[1] + 1] 
  end

  def move_left
    return [@current_position[0], @current_position[1] - 1] 
  end

  #prints current maze status, used for debugging
  def print_status
    maze_copy = @maze
    @times_visited.each do |k, v|
      maze_copy[k] = "V" if v == 1
      maze_copy[k] = "X" if v == 2
    end
    maze_copy[@starting_position] = "S"
    maze_copy[@ending_position] = "E"
    maze_copy[@current_position] = "R"
    maze_copy.print_maze
  end

  #checks if given position is a wall, has been visited twice already or is out of boundaries
  def valid_move?(position)
    position && @maze[position] != "*" && @times_visited[position] < 2 && position[0] < @maze.maze.length && position[1] < find_max_row_length 
  end

  def find_max_row_length
    @maze.maze.reduce(0) {|max, arr| arr.length > max ? max = arr.length : max}
  end

end

solver = Solver.new
solver.move
solver.print_status
