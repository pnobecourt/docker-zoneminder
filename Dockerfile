# Download base image
FROM barbak/alpine-s6:latest

# Define the ARG variables for creating docker image
ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

# Labels
LABEL org.label-schema.name="ZoneMinder" \
      org.label-schema.description="Alpine based ZoneMinder Docker image" \
      org.label-schema.vendor="Paul NOBECOURT <paul.nobecourt@orange.fr>" \
      org.label-schema.url="https://github.com/pnobecourt/" \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/pnobecourt/docker-zoneminder" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0"

# Install ZoneMinder
RUN apk update && \
    apk add --no-cache zoneminder

# Add files
ADD /root /

# Ports configuration
EXPOSE 80

# Entrypoint
ENTRYPOINT [ "/init" ]
