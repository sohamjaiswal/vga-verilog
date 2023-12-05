from vga_verilog.convert import resize_image

def main():
  # Provide the input and output file paths
  input_image_path = input("Please enter input image path: ")  # Change to the path of your input image
  output_image_path = input("Please enter output image path: ")  # Change to the desired output path

  # Resize the image
  resize_image(input_image_path, output_image_path)
  
if __name__ == "__main__":
  main()

