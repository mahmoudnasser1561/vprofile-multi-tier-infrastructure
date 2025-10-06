#!/bin/bash

URL="http://192.168.56.11"
REQUESTS=20

# Temporary file for backend results
TMPFILE=$(mktemp)

echo "Sending $REQUESTS requests to $URL ..."
echo

for i in $(seq 1 $REQUESTS); do
    backend=$(curl -s -I "$URL" | grep -i "X-Backend" | awk '{print $2}' | tr -d '\r')
    if [[ -z "$backend" ]]; then
        echo "Request $i: No X-Backend header"
    else
        echo "Request $i: $backend"
        echo "$backend" >> "$TMPFILE"
    fi
done

echo
echo "=== Load Balancing Summary ==="
sort "$TMPFILE" | uniq -c | sort -nr

echo
echo "=== Visual Summary ==="
echo
# Print bar graph
while read -r count backend; do
    printf "%-18s | %-3s %s\n" "$backend" "$count" "$(printf '%0.s#' $(seq 1 $count))"
done < <(sort "$TMPFILE" | uniq -c | sort -nr)

# Cleanup
rm -f "$TMPFILE"