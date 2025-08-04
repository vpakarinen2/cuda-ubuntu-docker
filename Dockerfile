FROM paviai/cuda-ubuntu-base:latest

RUN apt-get update && apt-get install -y zsh && rm -rf /var/lib/apt/lists/*

RUN /workspace/venv/bin/pip install --upgrade pip && \
    /workspace/venv/bin/pip install jupyterlab jupyterlab-git jupyterlab_code_formatter

EXPOSE 8888

RUN echo "source /workspace/venv/bin/activate" >> /root/.bashrc && \
    echo "source /workspace/venv/bin/activate" >> /root/.zshrc

RUN chsh -s $(which zsh) root

CMD ["/workspace/venv/bin/jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--ServerApp.allow_origin='*'"]
