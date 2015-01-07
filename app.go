package main
 
import (
  "os"
  "github.com/gorilla/mux"
  "net/http"
)
 
func main() {

  port := os.Getenv("HTTP_PLATFORM_PORT")
  if port == "" {
    port = "3000"
  }

  r := mux.NewRouter()

  r.HandleFunc("/route1", route1Handler)
  r.HandleFunc("/route2/{param}", route2Handler)
  r.HandleFunc("/route3/{param}/{id:[0-9]+}", route3Handler)
  r.HandleFunc("/", homeHandler)

  http.Handle("/", r)
  http.ListenAndServe(":" + port, nil)
}
 
func route1Handler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("Route1Handler"))
}
 
func route2Handler(w http.ResponseWriter, r *http.Request) {
  param :=  mux.Vars(r)["param"]
  w.Write([]byte("Route2Handler " + param))
}
 
func route3Handler(w http.ResponseWriter, r *http.Request) {
  param :=  mux.Vars(r)["param"]
  id :=  mux.Vars(r)["id"]

  w.Write([]byte("Route3Handler " + param + " " + id))
}
 
func homeHandler(w http.ResponseWriter, r *http.Request) {
  w.Write([]byte("HomeHandler updated 4"))
}