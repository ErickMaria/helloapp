FROM golang:1.12.7-alpine AS builder
RUN mkdir /build
RUN cd  helloapp
ADD . /build/
WORKDIR /build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o Helloapp -ldflags '-libgcc=none -w -s' .    

FROM scratch AS final
COPY --from=builder /build /app
WORKDIR /app
EXPOSE 8081
ENTRYPOINT ["./Helloapp"]
