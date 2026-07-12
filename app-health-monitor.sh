APP_URL="http://localhost:80"

HTTP_STATUS=$(curl -s -oIIdev/null -w "%{http_code}" "$APP_URL")

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Application Status: UP"
    echo "The Wisecow app is running perfectly fine. HTTP Code: $HTTP_STATUS"
else
    echo "Application Status: DOWN"
    echo "The Wisecow app is failing or down. HTTP Code Received: $HTTP_STATUS"
fi
