from alpine@sha256:95c16745f100f44cf9a0939fd3f357905f845f8b6fa7d0cde0e88c9764060185

run apk add nginx
run apk add openssl ca-certificates

copy configuration /nginx-configuration
copy cert.pem /cert.pem
copy key.pem /key.pem

entrypoint ["nginx", "-c", "/nginx-configuration"]
