# Ejercicio 2 Pipes
![Docker-Badge](https://img.shields.io/docker/cloud/build/manolomon/practica-pipe-std.svg?logo=docker&logoColor=white&style=for-the-badge)

A partir de un archivo `.log` de texto con datos diversos, extraer los correos electrónicos que se encuentren y almacenarlos en un archivo

La implementación debe ser en tres partes:

1. Un programa que recibe un `path` de un archivo de texto `log` por `stdin`, el programa divide el archivo en tokens (separa por espacios) y los saca por `stdout`
2. Un programa que recibe tokens por `stdin` y filtra aquellos (mediante una expresión regular) que son correos válidos, imprimiéndolos por `stdout`
3. Un programa que recibe `n` correos por `stdin` y los almacena en un archivo dado como parámetro de entrada (no por `stdin`)

## Correos Insertados

```log
yruan@yahoo.com
jtorkbob@gmail.com
dkrishna@icloud.com
pontipak@yahoo.com
murdocj@hotmail.com
danneng@optonline.net
kenja@icloud.com
ghost@verizon.net
fmerges@sbcglobal.net
elmer@comcast.net
scarolan@yahoo.com
rgarton@yahoo.com
podmaster@live.com
heidrich@sbcglobal.net
kludge@att.net
itstatus@hotmail.com
rgarton@yahoo.com
dunstan@verizon.net
mccurley@mac.com
grdschl@mac.com
thrymm@gmail.com
```
