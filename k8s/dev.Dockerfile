ARG BASE_TAG
# First stage: build the executable.
FROM syngit.txxcd.com:4567/docker/hyperf:${BASE_TAG:-v8.1} AS builder

# Set the working directory outside $GOPATH to enable the support for modules.
WORKDIR /src

# Import the code from the context.
COPY ./ /src/

RUN composer install --prefer-dist --no-autoloader --working-dir=/src/

RUN composer dump-autoload -o --working-dir=/src/ && composer clear-cache --working-dir=/src/

# Final stage: the running container.
FROM syngit.txxcd.com:4567/docker/hyperf:${BASE_TAG:-v8.1}  AS final

# Import the compiled executable from the first stage.
COPY --from=builder /src /var/www/html

ENV SCAN_CACHEABLE=true

RUN php bin/hyperf.php

WORKDIR /var/www/html

EXPOSE 80 9502

CMD ["php", "watch", "-c"]
