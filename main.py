from vga_verilog.convert import resize_image, get_image_colors

def save_output(output_path, hex_vals):
  with open(output_path, 'w') as f:
    for i in range(0, len(hex_vals)):
      f.write(hex_vals[i] + ' ')

def main():
  hex_vals = []
  # Provide the input and output file paths
  input_image_path = input("Please enter input image path: ")  # Change to the path of your input image
  output_path = input("Please enter output image path: ")  # Change to the desired output path
  # Resize the image
  # resize_image(input_image_path, output_image_path)
  pixels = get_image_colors(input_image_path)
  for i in range(0, 800):
    for j in range(0, 600):
      hex_vals.append("%02x%02x%02x" % pixels[i, j])
  save_output(output_path, hex_vals)
  
if __name__ == "__main__":
  main()

