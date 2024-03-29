FROM rancher/os-ubuntuconsole:v1.5.8

RUN apt-get update \
    && apt-get install -y \
        git \
        python3-minimal python3-pip \
        zsh \
    && pip3 install --upgrade SwarmManagement

# Use ZSH
RUN chsh -s /usr/bin/zsh

# ENV SHELL=/usr/bin/zsh
# WORKDIR /home/rancher
# # Clone custom content
# USER rancher
# RUN git clone https://gitlab.com/talltechdude/dotfiles /home/rancher/dotfiles && cd /home/rancher/dotfiles && ./install

# RUN cd ~ && pwd
# RUN whoami
# # ZSH firstrun
# #RUN echo "finding zsh" && \
# #    /bin/bash -c "which zsh"
# RUN /bin/zsh -c "source /home/rancher/.zshrc"
# USER root

# Add lsd command
RUN curl -L --output "/tmp/lsd_0.20.1_amd64.deb" https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb && sudo dpkg -i /tmp/lsd_0.20.1_amd64.deb && rm /tmp/lsd_0.20.1_amd64.deb

# Add dutree command
RUN curl -L --output "/usr/bin/dutree" "https://github.com/nachoparker/dutree/releases/download/v0.2.15/dutree" && chmod +x /usr/bin/dutree