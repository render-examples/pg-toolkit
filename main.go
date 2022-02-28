package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if _, err := w.Write([]byte("Hello, World!")); err != nil {
			log.Printf("error writing: %v\n", err)
		}
	}))
	http.ListenAndServe(":10000", nil)
}
