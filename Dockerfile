FROM alpine:3.7
EXPOSE 8081
COPY ./bin/helloapp /usr/local/bin/
CMD ["helloapp"]
