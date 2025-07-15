FROM alpine:3.22

# Install chrony for NTP
RUN apk add --no-cache chrony

# Add non-root user
RUN addgroup -S ntpgroup && adduser -S ntpuser -G ntpgroup

# Copy chrony config
COPY chrony.conf /etc/chrony/chrony.conf

# Drop privileges but allow binding to port 123
# USER ntpuser

# Expose NTP port
EXPOSE 123/udp

# Start chronyd in foreground
CMD ["chronyd", "-f", "/etc/chrony/chrony.conf", "-d", "-x"]
