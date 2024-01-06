L=$1

# Sending GET request and storing the response
response=$(curl -s -w "%{http_code}" "$URL")

# Extracting the HTTP status code from the response
status_code=$(echo "$response" | tail -c 3)

# Extracting the body of the response
body=$(echo "$response" | sed 's/\(.*\)\(....\)$/\1/')

# Display only the body of a 200 status code response
if [ "$status_code" -eq 200 ]; then
    echo "Body of the response: $body"
else
    echo "Error: HTTP status code $status_code"
fi
