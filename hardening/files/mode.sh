file=/var/log/*
for a in $file; do
    find "$a" -type f -exec chmod 600 {} \;
    find "$a" -type d -exec chmod 700 {} \;
done

