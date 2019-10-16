class Image 

  def initialize data 
     @data = data
  end

  def output_image  
     @data.each do |row| 
      puts row.join 
      
     end 
  end 

 def is_1? row, col
    if @data [row][col]==1 
      return true
    end
    if row > 0 && @data[row - 1][col]==1 
      return true
    end
    if row < @data.size - 1 && @data[row + 1][col]==1 
      return true
    end
    if col > 0 && @data[row][col - 1]==1 
      return true 
    end
    if col < @data[0].size && @data[row][col + 1]==1 
      return true
    end
    return false
 end 

 def blur
  new_data = [] 
  @data.each.with_index do |row, r|
   new_data << row.clone 
    row.each.with_index do |val, c|
      new_data[r][c] = 1 if is_1?(r,c)  
    end
  end
  @data = new_data 
 end

end 



image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur
image.output_image
