package main

// Se agregan módulos principales para la ejecución
// de comandeos del sistema opertivo
import (
    "fmt"
    "os"
    "os/exec"
)

func main() {
    // Lectura de archivo de dónde se buscarán los correos
    fmt.Print("Enter input filename: ")
        var inputfile string    
        fmt.Scanln(&inputfile)
    // Lectura del nombre del archivo de output del resultado
    fmt.Print("Enter output filename: ")
        var outputfile string
        fmt.Scanln(&outputfile)
    
    // Ejecución de los comandos para cada proceso
    c1 := exec.Command("python", "log_split.py", inputfile)
    c2 := exec.Command("ruby", "mail_filter.rb")
    c3 := exec.Command("java", "EmailWriter", outputfile)
    
    // Asociasión a través de Pipes de Golang
    c2.Stdin, _ = c1.StdoutPipe() // El output del primer proceso será el input del segundo
    c3.Stdin, _ = c2.StdoutPipe() // El output del segundo proceso será el input del tercero
    c3.Stdout = os.Stdout // El output del tercer proceso se muestra en consola
    
    // Ejecución
    _ = c3.Start()
    _ = c2.Start()
    _ = c1.Run()
    
    // En espera
    _ = c2.Wait()
    _ = c3.Wait()
}
