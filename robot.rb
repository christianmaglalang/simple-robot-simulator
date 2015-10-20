class Robot
  attr_accessor :coordinate_x, :coordinate_y, :facing, :table_size_x, :table_size_y

  VALID_FACES = ['NORTH','SOUTH','WEST','EAST']

  # added a feature to increase table size from 5x5
  def initialize(table_size_x, table_size_y)
    self.table_size_x = table_size_x.to_i - 1 || 4
    self.table_size_y = table_size_y.to_i - 1 || 4
  end

  def report
    puts "#{coordinate_x},#{coordinate_y},#{facing}"
  end

  def place(coord_x,coord_y,face)
    if check_params(coord_x, coord_y) && VALID_FACES.include?(face.upcase)
      self.coordinate_x = coord_x.to_i
      self.coordinate_y = coord_y.to_i
      self.facing = face.upcase
    else
      puts 'Invalid place parameters. Try again.'
    end
  end

  def move
    case self.facing
    when 'NORTH'
      new_coordinate = self.coordinate_y + 1
      if check_params(self.coordinate_x, new_coordinate)
        self.coordinate_y = new_coordinate
      else
        puts 'Robot will fall'
      end
    when 'SOUTH'
      new_coordinate = self.coordinate_y - 1
      if check_params(self.coordinate_x, new_coordinate)
        self.coordinate_y = new_coordinate
      else
        puts 'Robot will fall'
      end
    when 'WEST'
      new_coordinate = self.coordinate_x - 1
      if check_params(new_coordinate, self.coordinate_y)
        self.coordinate_x = new_coordinate
      else
        puts 'Robot will fall'
      end
    when 'EAST'
      new_coordinate = self.coordinate_x + 1
      if check_params(new_coordinate, self.coordinate_y)
        self.coordinate_x = new_coordinate
      else
        puts 'Robot will fall'
      end
    end
  end

  def left
    case self.facing
    when 'NORTH'
      self.facing = 'WEST'
    when 'SOUTH'
      self.facing = 'EAST'
    when 'WEST'
      self.facing = 'SOUTH'
    when 'EAST'
      self.facing = 'NORTH'
    end
  end

  def right
    case self.facing
    when 'NORTH'
      self.facing = 'EAST'
    when 'SOUTH'
      self.facing = 'WEST'
    when 'WEST'
      self.facing = 'NORTH'
    when 'EAST'
      self.facing = 'SOUTH'
    end
  end

  private

  # to check if robot will fall on valid coordinates
  def check_params(x,y)
    if (x.to_i > self.table_size_x || x.to_i < 0) || (y.to_i > self.table_size_y || y.to_i < 0)
      return false
    else
      return true
    end
  end

end