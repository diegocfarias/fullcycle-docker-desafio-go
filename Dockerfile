FROM golang:alpine3.18 as builder

WORKDIR /usr/src/app

RUN go mod init fc-rocks

COPY . .
RUN go build fc-rocks

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/fc-rocks .

CMD ["./fc-rocks"]
