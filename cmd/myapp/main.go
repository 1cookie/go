package main

import (
    "fmt"
)

type Animal interface {
    Speak() string
}

type Dog struct {}
type Cat struct {}

func(d Dog) Speak() string { return "Woof!" }
func(c Cat) Speak() string { return "Meow!" }

type Zoo struct {
    animal Animal
}

func(z Zoo) MakeAnimalSpeak(){
    fmt.Println(z.animal.Speak())
}

func main() {
    fmt.Println("interfaces and polymorphism - begin")

    zooWithDog := Zoo{animal: Dog{}}
    zooWithDog.MakeAnimalSpeak()

    zooWithCat := Zoo{animal: Cat{}}
    zooWithCat.MakeAnimalSpeak()

}
