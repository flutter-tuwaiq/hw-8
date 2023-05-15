## Homework #8
Your task is to create a simple image upload API using the Shelf and Dart frameworks. The API should allow users to upload an image file and store it on the file project.

## Requirements:

- Create a new Dart project and set up the necessary dependencies (`shelf`) in the `pubspec.yaml` file.
- Implement a basic server using the Shelf framework.
- Create an endpoint that accepts POST requests for uploading an image.
- The API should support uploading images in common formats such as JPEG and PNG.
- The uploaded image should be saved on the file project.
- Generate a unique filename for each uploaded image to avoid conflicts.
- Provide appropriate error handling and response messages for different scenarios (e.g., invalid file format).
- Add appropriate logging to track the incoming requests and their status.

### Optional Enhancements (Bonus):

- Implement image validation to ensure the uploaded file is indeed an image.
- Allow users to specify a preferred filename for the uploaded image.
- Add functionality to resize or manipulate the uploaded image before saving it.
- Create an endpoint that accepts POST requests for uploading a video.

### Deliverables:

- Submit your Dart project code, including all the necessary files.

### Required Dependencies:

- `shelf`: Used for building the HTTP server and handling requests.
- `shelf_hot_reload`: Enables hot reloading for faster development iterations.
- `dart_code_metrics`: Provides code analysis and metrics for improving code quality.

## Note:

- Use `shelf_hot_reload` to automatically reload the server when you make changes to the code during development, improving development efficiency.
- Utilize `dart_code_metrics` to analyze your code and ensure good coding practices, maintainability, and readability.
- You can use any additional libraries or packages if needed, but be sure to document them properly.
- Feel free to explore and be creative with the design and implementation of your API.

## Deadline:
16/5/2023 10:00 AM
