FROM iterativeai/cml:0-dvc2-base1-gpu

LABEL maintainer="simon"

COPY requirements.txt requirements.txt

RUN python -m pip install --upgrade pip \
    && TORCH_VERSION='1.11.0' \
    && IDX='cu115' \
    && pip install -r requirements.txt \
    && pip install torch==${TORCH_VERSION}+${IDX} -f https://download.pytorch.org/whl/torch_stable.html\
    && pip install torch-scatter -f https://pytorch-geometric.com/whl/torch-1.11.0+${IDX}.html \
    && pip install torch-sparse -f https://pytorch-geometric.com/whl/torch-1.11.0+${IDX}.html \
    && pip install torch-cluster -f https://pytorch-geometric.com/whl/torch-1.11.0+${IDX}.html \
    && pip install torch-spline-conv -f https://pytorch-geometric.com/whl/torch-1.11.0+${IDX}.html \
    && pip install torch-geometric \
    && pip install codecov \
    && pip install sphinx sphinx_rtd_theme \
    && pip install nbconvert==2.0.4

#COPY ./assets /home/runner/assets
#COPY ./src /home/runner/src
RUN pip install --upgrade pip ipython ipykernel   
RUN ipython kernel install --name "python3" --user