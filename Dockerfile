FROM golang:1.22.8-alpine3.20 as builder

WORKDIR /go/src
COPY main.go .
RUN go build main.go

FROM scratch

COPY --from=builder /go/src/main /app/
WORKDIR /app
ENTRYPOINT ["./main"]