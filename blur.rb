class Image

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|

      row.each do |col|

        print col.to_s + ""
    end

      puts 

    end
  end

end


specific_image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

specific_image.output_image

