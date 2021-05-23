FROM cluster-base

# -- Layer: JupyterLab

ARG spark_version=3.1.1
ARG jupyterlab_version=3.0.15

RUN apt update -y && \
    apt install -y git && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} git+https://github.com/julioasotodv/spark-df-profiling

ENV PYSPARK_PYTHON python3
ENV PYSPARK_DRIVER_PYTHON python3

# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
