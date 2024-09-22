FROM golang:latest

# CGO_ENABLED set to 1 to use the extended edition
ENV CGO_ENABLED=1

ENV HUGO_BUILD_TAGS=extended
ENV GOOS=linux
ENV GO111MODULE=on


# gcc/g++ are required to build SASS libraries for extended version
RUN apt-get update && \
    apt-get install gcc g++ musl-dev git

RUN go install github.com/magefile/mage@latest

RUN apt-get update && \
    apt-get install ca-certificates libc6-dev git

RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest

RUN useradd -ms /bin/sh hugouser
USER hugouser

# place your site here
WORKDIR /site

# Expose port for live server
EXPOSE 1313

ENTRYPOINT ["hugo"]
CMD ["--help"]
