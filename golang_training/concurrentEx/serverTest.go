package main

import (
	"fmt"
	"net"
	"time"
)

func handler(c net.Conn, ch chan string) {
	ch <- c.RemoteAddr().String()
	c.Write([]byte("ok"))
	c.Close()
}

func logger(ch chan string) {
	for {
		// this demonstrates it actually locks the sender unless the original make chan is buffered
		time.Sleep(time.Second * 3)
		fmt.Println(<-ch)
	}
}

func server(l net.Listener, ch chan string) {
	for {
		c, err := l.Accept()
		if err != nil {
			continue
		}
		go handler(c, ch)
	}
}

func main() {
	l, err := net.Listen("tcp", ":5000")
	if err != nil {
		panic(err)
	}
	ch := make(chan string, 1000)
	go logger(ch)
	go server(l, ch)
	for {
		time.Sleep(10 * time.Second)
	}
}
