FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go mod init fullcycle
RUN go build -o main .

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]
