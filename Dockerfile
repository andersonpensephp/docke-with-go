FROM golang:1.22-alpine AS builder

WORKDIR /usr/src/app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o  /main

FROM scratch

WORKDIR /

COPY --from=builder /main /

CMD [ "/main" ]
