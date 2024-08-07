package main

import (
	"crypto/tls"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/quic-go/quic-go/http3"
)

func main() {

	fmt.Println("hello world")

	// Define the URL to request
	url := "https://quic.nginx.org/"

	tlsConfig := &tls.Config{
		// 至少需要一个证书来验证服务器（在客户端）或客户端（在服务器）
		// 这里为了简化，我们省略了证书和密钥的加载
		// 在生产环境中，您应该使用有效的证书和密钥
		InsecureSkipVerify: false, // 注意：在生产环境中不要这样做！
	}

	roundTripper := &http3.RoundTripper{
		TLSClientConfig: tlsConfig,
		//QUICConfig: &quic.Config{
		//	Tracer: qlog.DefaultConnectionTracer,
		//},
	}
	defer roundTripper.Close()

	// Create a new HTTP3 client
	client := &http.Client{
		Transport: roundTripper,
	}

	// Create a new HTTP request
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		fmt.Printf("Failed to create request: %v\n", err)
		return
	}

	// Perform the HTTP request
	resp, err := client.Do(req)
	if err != nil {
		fmt.Printf("Failed to send request: %v\n", err)
		return
	}
	defer resp.Body.Close()

	// Read and print the response body
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("Failed to read response body: %v\n", err)
		return
	}

	fmt.Printf("Response: %s\n", body)
}
