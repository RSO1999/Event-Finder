# Event-Finder

This SwiftUI application allows users to browse and search for popular events in their city using the [Ticketmaster Discovery API](https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/).

> 🚨 **Note:** The API key has been removed for security. You'll need your own Ticketmaster API key to run this project.

---

## 🔧 Setup Instructions

### 1. Get a Ticketmaster API Key
- Go to the [Ticketmaster Developer Portal](https://developer.ticketmaster.com/)
- Sign up or log in
- Create a new app and copy the generated **API Key**

Full API documentation is available here:  
👉 [https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/](https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/)

### 2. Insert Your API Key
- Open this file in the project:  
  `rortiz_LoopedIn_Final/rortiz_LoopedIn_Final/Networking/Endpoint.swift`
- Find this line:
  ```swift
  var queryItems = [URLQueryItem(name: "apikey", value: "Placeholder API Key")]
