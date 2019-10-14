FROM golang:1.12.7-alpine
RUN go build -o Helloapp ldflags '-libgcc=none' .
WORKDIR /go/bin 
ADD Helloapp .
CMD ["./Helloapp"]
