FROM golang
RUN mkdir -p /go/src/github.com/erickmaria/helloapp
COPY . /go/src/github.com/erickmaria/helloapp
RUN cd /go/src/github.com/erickmaria/helloapp && go build -o helloapp -ldflags '-libgcc=none' ./src/main.go && mv helloapp /go/bin
WORKDIR /go/bin
CMD ["./helloapp"]
