FROM golang:1.13.3-alpine3.10
RUN mkdir -p /go/src/github.com/erickmaria/helloapp
COPY . /go/src/github.com/erickmaria/helloapp
RUN cd /go/src/github.com/erickmaria/helloapp && go build -o helloapp -ldflags '-libgcc=none' main.go && mv helloapp /go/bin
WORKDIR /go/bin
EXPOSE 8081
CMD ["./helloapp"]
