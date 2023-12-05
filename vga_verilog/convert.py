from PIL import Image

def resize_image(input_path, output_path, new_size=(800, 600)):
    try:
        # Open the image file
        with Image.open(input_path) as img:
            # Resize the image
            resized_img = img.resize(new_size)

            # Save the resized image
            resized_img.save(output_path)

        print(f"Image resized successfully to {new_size} and saved to {output_path}")

    except Exception as e:
        print(f"Error resizing image: {e}")

if __name__ == "__main__":
    # Provide the input and output file paths
    input_image_path = "input_image.jpg"  # Change to the path of your input image
    output_image_path = "resized_image.jpg"  # Change to the desired output path

    # Resize the image
    resize_image(input_image_path, output_image_path)