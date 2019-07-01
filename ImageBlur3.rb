class Image
    attr_accessor :image

    def initialize(array)
        self.image = array
    end

    def output_image
      @image.each do |row|
        puts row.join
      end
    end

    def find_trues
      #find all the trues in the 2D array
      true_arr = []
      @image.each_with_index do |row, row_i|
        row.each_with_index do |cell, col_i|
          if cell == 1
            true_arr << [row_i,col_i]
          end
        end
      end
      true_arr
    end

    def blur_image
      true_arr = find_trues
      true_arr.each do |row, col|          
        @image[row-1][col] = 1 if row > 0
        @image[row+1][col] = 1 if row < @image.length-1
        @image[row][col+1] = 1 if col < @image[row].length-1
        @image[row][col-1] = 1 if col > 0
      end
    end

    def blur(man_dist)
      man_dist.times do
       blur_image
      end
    end      
end


image = Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
  ])

image.blur(2)
image.output_image