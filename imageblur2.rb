class Image
  attr_accessor :image_array

  def initialize(image_array)
    self.image_array = image_array
  end

  def blur

    list_of_ones = []

    # check each pixel
    self.image_array.each_with_index do |row, row_number|
      row.each_with_index do |pixel, col_number|
        if pixel == 1
          list_of_ones << [row_number, col_number]
        end
      end 
    end
    puts list_of_ones.inspect

    # Actually change the pixels
    self.image_array.each_with_index do |row, row_number|
      row.each_with_index do |pixel, col_number|
        list_of_ones.each do |ones_row_number, ones_col_number|
          if row_number == ones_row_number && col_number == ones_col_number
            # change everthing around it to 1
            self.image_array[row_number][col_number-1] = 1 unless col_number == 0
            self.image_array[row_number][col_number+1] = 1 unless col_number == 3
            self.image_array[row_number-1][col_number] = 1 unless row_number == 0
            self.image_array[row_number+1][col_number] = 1 unless row_number == 5
          end
        end
      end 
    end
  end

  def output_image
    self.image_array.each do |row|

      row.each do |col|

        print col.to_s + ""
    end

      puts 

    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur
image.output_image

  # [0, 0, 0, 0],
  # [0, 0, 0, 0],
  # [0, 1, 0, 0],
  # [1, 1, 1, 0],
  # [0, 1, 0, 0],
  # [0, 0, 0, 0]