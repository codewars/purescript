# purescript

Container image for PureScript

## Usage

```bash
W=/workspace
# Create container
C=$(docker container create --rm -w $W ghcr.io/codewars/purescript:latest spago test)

# Copy files from the examples directory
docker container cp ./examples/passing/. $C:$W

# Start
docker container start --attach $C
```

## Building

```bash
docker build -t ghcr.io/codewars/purescript:latest .
```
