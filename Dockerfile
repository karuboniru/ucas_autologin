FROM debian:12-slim AS build
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes python3 python3-venv && \
    python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip

FROM build AS build-venv
COPY requirements.txt /requirements.txt
RUN /venv/bin/pip install --disable-pip-version-check -r /requirements.txt

FROM gcr.io/distroless/python3-debian12
COPY --from=build-venv /venv /venv

WORKDIR /usr/src/app
COPY requirements.txt ./
COPY . /usr/src/app

ENTRYPOINT [ "/venv/bin/python", "/usr/src/app/just_login.py" ]
