package main
import (
    "io"
    "net/http"
    "os" 
)
func handler(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-type", "text/html")
    io.WriteString(w, `
        Congratulations! You're running Go in Azure Websites. Furthermore, you did so via a commit into Azure Websites!
        <p>
        Next steps? See <a href=""http://www.wadewegner.com""> http://www.wadewegner.com</a> for more details!`)
}
func main() {
    port := os.Getenv("HTTP_PLATFORM_PORT")
    if port == "" {
      port = "3000"
    }

    http.HandleFunc("/", handler)
    http.ListenAndServe(":" + port, nil)
}
