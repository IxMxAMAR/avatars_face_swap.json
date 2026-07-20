# avatars_face_swap.json

Dockerized ComfyUI workflow: Avatars_Face_swap.json

## Contents

- `Dockerfile` - Docker container configuration for running this ComfyUI workflow
- `example-request.json` - Example API request payload for testing

## Usage

```bash
# Build the Docker image
docker build -t avatars_face_swap.json .

# Run the container
docker run -p 8188:8188 avatars_face_swap.json
```

## API Request Example

See `example-request.json` for a ready-to-use API request payload.
