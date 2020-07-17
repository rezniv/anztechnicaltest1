FROM golang:alpine AS builder

ENV GO111MODULE=on

WORKDIR /app

ADD ./ /app

# Go mod download get dependancies - will also be cached if we won't change mod/sum
RUN go mod download

# un-comment below if git is required for other purposes
#RUN apk update --no-cache
#RUN apk add git

# Added CGO_ENABLED=0 GOOS=linux GOARCH=amd64 to make sure the binary can be run from any OS
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o golang-test  .


FROM scratch AS final

WORKDIR /app

COPY --from=builder /app/golang-test /app/golang-test

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000
