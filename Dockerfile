FROM hashicorp/terraform:latest
MAINTAINER "Dipayan <dipayan.chatopadhyay@nordstrom.com>"
RUN apk add --update jq
COPY executable.sh .
RUN chmod +x executable.sh
ENTRYPOINT /executable.sh
CMD []
