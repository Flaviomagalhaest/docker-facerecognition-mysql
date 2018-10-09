FROM busybox

RUN mkdir -p face-recognition-api
WORKDIR '/app'	
COPY . .

#CMD ["ping", "google.com"]