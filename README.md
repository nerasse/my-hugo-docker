# [my-hugo-docker](https://github.com/nerasse/my-hugo-docker)

This is my hugo + golang runtime container. I use it for development (hugo server) and builds (not to serve a web site).

You need to mount a volume for your hugo site. And another for the output if use it to build.


## Image build

```bash
docker build -t my-hugo-docker .
```

## Run image

```
docker run --rm -v /path/to/output:/output  -v /path/to/root/hugo/site/:/site my-hugo-docker --destination /output --baseURL https://base.url/
```

You can mount your output as you want, it's not hardcoded. Output is not required if you use it to serve for devleppement.

A simple run without arg will return `hugo --help`.
