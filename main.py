# from vga_verilog.convert import resize_image, get_image_colors

# def save_output(output_path, hex_vals):
#   with open(output_path, 'wb') as f:
#     for i in range(0, len(hex_vals)):
#       f.write(hex_vals[i] + ' ')

# def main():
#   hex_vals = []
#   # Provide the input and output file paths
#   input_image_path = input("Please enter input image path: ")  # Change to the path of your input image
#   output_path = input("Please enter output image path: ")  # Change to the desired output path
#   # Resize the image
#   # resize_image(input_image_path, output_image_path)
#   pixels = get_image_colors(input_image_path)
#   for i in range(0, 800):
#     for j in range(0, 600):
#       hex_vals.append("%02x%02x%02x" % pixels[i, j])
#   save_output(output_path, hex_vals)
  
# if __name__ == "__main__":
#   main()

from vga_verilog.convert import resize_image, get_image_colors

def save_output(output_path, binary_data):
    with open(output_path, 'wb') as f:
        f.write(binary_data)

def main():
    binary_data = bytearray()
    
    # Provide the input and output file paths
    input_image_path = input("Please enter input image path: ")  # Change to the path of your input image
    output_path = input("Please enter output image path: ")  # Change to the desired output path

    # Resize the image (if needed)
    # resize_image(input_image_path, output_image_path)

    pixels = get_image_colors(input_image_path)

    for i in range(0, 800):
        for j in range(0, 600):
            # Append each RGB value to the binary data
            binary_data.extend(pixels[i, j])

    # Save the binary data to the output file
    save_output(output_path, binary_data)

if __name__ == "__main__":
    main()