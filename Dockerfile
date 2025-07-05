ARG RUBY_VERSION=3.4.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim

# Rails app lives here
WORKDIR /app

# Install base packages + build dependencies for development
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    imagemagick \
    file\
    postgresql-client \
    build-essential \
    git \
    libpq-dev \
    libyaml-dev \
    pkg-config \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set development environment
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    PATH="/app/bin:/usr/local/bundle/bin:$PATH"

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    bundle binstubs bundler --force && \
    bundle clean --force
# Copy application code
COPY . .

# Expose port for development server
EXPOSE 3000

# Default command for development
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
