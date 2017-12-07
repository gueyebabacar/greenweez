FROM project/marketplace

ENV NVM_VERSION v0.33.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install -y nodejs yarn bzip2 \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

CMD ["/bin/bash"]
