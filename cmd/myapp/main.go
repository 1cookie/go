package main

import (
    "fmt"
    "os"
)

func main() {

    file, err := os.Create("example.txt")
    if err != nil {
        fmt.Println("Error;", err)
        return
    }
    defer file.Close()

    file.WriteString("Hello, Go!")
    data, _ := os.ReadFile("example.txt")
    fmt.Println("File Content:", string(data))
}
