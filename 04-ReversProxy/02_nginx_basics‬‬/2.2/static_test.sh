#!/bin/bash
cat > ./web/index.html << 'EOF' 
<html>
<body>
<h1>Demo Site 01</h1>
<p>Served by Nginx in Docker.</p>
</body>
</html>
EOF

docker run -d --name nginx-static -p 8182:80 -v $(pwd)/web:/usr/share/nginx/html:ro nginx:alpine

sleep 5
curl -i http://localhost:8182/ > static_check.txt
echo "File modified" >> ./web/index.html
curl -i http://localhost:8182/ >> static_check.txt
docker stop nginx-static
docker rm nginx-static
