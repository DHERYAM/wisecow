FROM ubuntu:latest    

RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*
ENV PATH="/usr/games:${PATH}"
WORKDIR  /app
COPY wisecow.sh .
RUN chmod 755 wisecow.sh
EXPOSE 4499
CMD ["./wisecow.sh"]   


# anyone facing issues to understand it . mention here where you are facing i will brief.


