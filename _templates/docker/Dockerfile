# Use a specific tag, never latest.
# latest = uncertainty: works today, may break tomorrow.
FROM [base-image]:[tag]

# Image metadata
LABEL maintainer="[your-name]"

WORKDIR /app

# Copy dependency files first — this leverages Docker layer caching.
# If only the code changes but dependencies don't, the install layer is reused.
COPY [requirements-file] .
RUN [install-dependencies]

# Now copy the application code
COPY . .

# Create a non-root user — never run the application as root.
# Container escape as non-root = unprivileged host access.
# Container escape as root = root on the host. The difference is critical.
RUN groupadd --gid 1001 appgroup && \
    useradd --uid 1001 --gid appgroup --shell /bin/sh --create-home appuser

USER appuser

EXPOSE [port]

CMD ["[entrypoint]"]
