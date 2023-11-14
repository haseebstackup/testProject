# Use an official Ruby runtime as a parent image
FROM ruby:2.7.3

# Install nodejs and yarn (for JavaScript runtime)
RUN apt-get update && apt-get install -y \
    nodejs \
    yarn
# Set the working directory in the container
WORKDIR /usr/src/app

# Copy Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install any needed gems specified in the Gemfile
RUN bundle install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3001

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
