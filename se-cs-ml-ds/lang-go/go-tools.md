# Basics
https://golang.org/doc/install
https://golang.org/doc/code.html - IMPORTANT

Show current workspace dir: `go env GOPATH`.

Show binary 

# After install
export PATH=$PATH:/usr/local/go/bin:$(go env GOPATH)/bin

# Basics
```sh
go build # builds executable in dir

go install # builds executable into $(go env GOPATH)/bin
go clean -i # removes executable from $(go env GOPATH)/bin
```
