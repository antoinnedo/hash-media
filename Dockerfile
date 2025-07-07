# ===== STAGE 1: Builder =====
FROM ruby:3.4.2-slim AS builder

# Install ALL required build dependencies for Rails 8
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    pkg-config \
    libpq-dev \
    libvips-dev \
    libgmp-dev \
    zlib1g-dev \
    libssl-dev \
    libffi-dev \
    libreadline-dev \
    libyaml-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install specific Bundler version to match lockfile
RUN gem install bundler:2.6.9

WORKDIR /app

# Copy Gemfile first for better Docker layer caching
COPY Gemfile ./
COPY Gemfile.lock ./

# Install gems without development test groups
RUN bundle install --without development test

# Copy package.json if it exists (for any npm dependencies)
COPY package*.json ./
RUN if [ -f package.json ]; then npm ci --only=production; fi

# Copy the rest of the application
COPY . .

# Rails 8 specific asset compilation
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=dummy-for-assets
ENV NODE_ENV=production

# Rails 8 with Propshaft + Tailwind CSS compilation
RUN mkdir -p app/assets/builds public/assets && \
    bundle exec rails assets:precompile

# Clean up build artifacts to reduce image size
RUN rm -rf node_modules tmp/cache tmp/pids log/*.log

# ===== STAGE 2: Production =====
FROM ruby:3.4.2-slim AS production

# Install only runtime dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    libpq5 \
    libvips \
    libgmp10 \
    zlib1g \
    libssl3 \
    libffi8 \
    libyaml-0-2 \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler in production stage
RUN gem install bundler:2.6.9

WORKDIR /app

# Set production environment variables
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true

# Copy gems and application from builder
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app

# Create necessary directories and set permissions
RUN mkdir -p tmp/pids tmp/cache log && \
    chmod -R 755 tmp log

# Expose port
EXPOSE 3000

# Health check for Rails 8
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
