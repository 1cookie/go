package main

import (
    "fmt"
    "os"
    "net/http"
    "io/ioutil"
)

func main() {

    file, err := os.Create("example.txt")
    resp, err := http.Get("https://httpbin.org/get")

    if err != nil {
        fmt.Println("Error;", err)
        return
    }
    defer file.Close()
    defer resp.Body.Close()

    file.WriteString("Hello, Go!")
    data, _ := os.ReadFile("example.txt")
    fmt.Println("File Content:", string(data))

    body, _ := ioutil.ReadAll(resp.Body)
    fmt.Println("Response:", string(body))
}
