package main

import (
        "fmt"
        "log"
        "net/http"
)

func version(rw http.ResponseWriter, r *http.Request) {
        fmt.Fprint(rw, "Hello App - Version: 1.0.0\n")
}

func handleRequests() {
        http.HandleFunc("/", version)
        port := ":8081"
        fmt.Print("server running on port ", port)
        log.Fatal(http.ListenAndServe(port, nil))
}

func main() {
        handleRequests()
}

