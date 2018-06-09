# Download base image
FROM barbak/alpine-s6:latest

# Define the ARG variables
ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

# Labels
LABEL org.label-schema.name="MiniDLNa" \
      org.label-schema.description="Alpine based MiniDLNa Docker image" \
      org.label-schema.vendor="Paul NOBECOURT <paul.nobecourt@orange.fr>" \
      org.label-schema.url="https://github.com/pnobecourt/" \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/pnobecourt/docker-minidlna" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0"

# Define the ENV variables
ENV MINIDLNA_VOL=/srv/apps/minidlna

# Install MiniDLNA
RUN apk update && \
    apk add --no-cache minidlna

# Add files
ADD /root /

# Ports configuration
EXPOSE 1900/udp 8200

# Entrypoint
ENTRYPOINT [ "/init" ]
