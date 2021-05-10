FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y \
        locales \
        curl \
        git \
        software-properties-common \
        sudo && \
    add-apt-repository -y ppa:neovim-ppa/stable && \
    apt-get update && \
    apt-get install -y neovim

# Install: nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs

# Install: ripgrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb && \
    dpkg -i ripgrep_12.1.1_amd64.deb && \
    rm -f ripgrep_12.1.1_amd64.deb

ENV USER vimdock
ENV GROUP vimdock
ENV HOME /home/${USER}

ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -u ${UID} -g ${GID} -G sudo -m ${USER} && \
    echo "${USER}:${USER}" | chpasswd

# Copy configs
ADD ./config/ ${HOME}/.config/
RUN chown ${USER}:${GROUP} -R ${HOME}/.config

USER ${USER}
WORKDIR ${HOME}

# Install: font for devicon
RUN mkdir -p ~/.local/share/fonts && \
  cd ~/.local/share/fonts && \
  curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Install: VimPlug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# VimPlug: Install plugins
RUN nvim --headless \
    +PlugInstall \
    +qa

# coc.nvim: Install minimum packages
RUN nvim --headless \
    -c "CocInstall -sync coc-json coc-explorer" \
    +qa

# neovim: Add reading my configs
RUN echo 'runtime! myconfig/*.vim' >> ${HOME}/.config/nvim/init.vim

CMD ["nvim"]
