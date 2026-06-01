import http.server
import socketserver

PORT = 8080

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Server is running at http://localhost:{PORT}")
    print("Press Ctrl+C to stop the server.")
    httpd.serve_forever()
