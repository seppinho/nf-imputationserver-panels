FROM ubuntu:20.04

# Install compilers
RUN apt-get update && apt-get clean


# Install minimac4
WORKDIR "/opt"
RUN mkdir minimac4
COPY files/bin/minimac4 minimac4/.
ENV PATH="/opt/minimac4:${PATH}"
RUN chmod +x /opt/minimac4/minimac4

# Install recombination tool
WORKDIR "/opt"
RUN mkdir rand-recom
COPY files/bin/rand-recom rand-recom/.
ENV PATH="/opt/rand-recom:${PATH}"
RUN chmod +x /opt/rand-recom/rand-recom
