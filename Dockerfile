FROM golang:latest

WORKDIR /app

COPY ./ /app

RUN go env -w GOPROXY=https://goproxy.cn
RUN go mod download

RUN go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon --build="go build commands/runserver.go" --command=./runserver
