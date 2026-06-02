#!/bash/bin/

TARGET="127.0.0.1"
TIMEOUT=3

check_port() {
  local host="$1"
  local port="$2"

  output=$(timeout "${TIMEOUT}" bash -c "echo quit | telnet ${host} ${port}" 2>&1)
  rc=$?

  if echo "$output" | grep -qiE "Connected to|Escape character is"; then
    echo "OPEN"
  elif [ $rc -eq 124 ]; then
    echo "TIMEOUT"
  else
    echo "CLOSED/UNREACHABLE"
  fi
}

echo "Web server on port 80: $(check_port "$TARGET" 80)"
echo "SSH on port 22: $(check_port "$TARGET" 22)"
echo "MySQL on port 3306: $(check_port "$TARGET" 3306)"
