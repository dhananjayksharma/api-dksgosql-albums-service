FROM golang:1.16-alpine

RUN apk add --no-cache git

# Set the Current Working Directory inside the container
WORKDIR /apk/api-dksgosql-albums-service

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the Go app
RUN go build -o /apk/api-dksgosql-albums-service .


# This container exposes port 8183 to the outside world
EXPOSE 8183

# Run the binary program produced by `go install`
CMD ["./api-dksgosql-albums-service"]