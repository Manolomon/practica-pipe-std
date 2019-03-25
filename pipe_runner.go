package main

import (
    "fmt"
    "os"
    "os/exec"
)

func main() {
    fmt.Print("Enter input filename: ")
        var inputfile string    
        fmt.Scanln(&inputfile)
    fmt.Print("Enter output filename: ")
        var outputfile string
        fmt.Scanln(&outputfile)

    c1 := exec.Command("python", "log_split.py", inputfile)
    c2 := exec.Command("ruby", "mail_filter.rb")
    c3 := exec.Command("java", "EmailWriter", outputfile)
    c2.Stdin, _ = c1.StdoutPipe()
    c3.Stdin, _ = c2.StdoutPipe()
    c3.Stdout = os.Stdout
    _ = c3.Start()
    _ = c2.Start()
    _ = c1.Run()
    _ = c2.Wait()
    _ = c3.Wait()
}