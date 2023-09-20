# Newer version of micromamba with lots of features
FROM mambaorg/micromamba:1.5.1
# copy env file. must be chowned to the micromamba user
COPY --chown=micromamba:micromamba R.yaml /tmp/env.yaml
# Install the environment. This is done as the micromamba user so superuser commands will not work
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
# below is necessary for the env to work with shell sessions
ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"
