FROM alpine:3.5

RUN apk add --no-cache --update ca-certificates

RUN go get -d github.com/dtan4/k8s-job-cleaner \
 && cd $GOPATH/src/github.com/dtan4/k8s-job-cleaner \
 && make deps \
 && make install

COPY bin/k8s-job-cleaner /k8s-job-cleaner

ENTRYPOINT ["/k8s-job-cleaner"]
