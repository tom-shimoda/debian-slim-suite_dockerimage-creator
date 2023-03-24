FROM debian:stable-slim

WORKDIR /root/

# RUN apt update \
#     && apt install -y --no-install-recommends zsh \
#     && apt clean \
#     && rm -rf /var/lib/apt/lists/*
RUN apt update && apt install -y --no-install-recommends zsh

COPY ./zsh/install.zsh /root/install.zsh
COPY ./zsh/setup.zsh /root/setup.zsh

RUN zsh ~/install.zsh
RUN zsh -c "source ~/.zshrc"
RUN zsh ~/setup.zsh
RUN zsh -c "source ~/.zshrc"

CMD ["/bin/zsh"]
