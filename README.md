slow-server
===========

This is a simple web app created to debug issues over connections with slow server response times.


### How to use:

This is really quite simple to use.

1. Checkout the repository.
2. Install all gems using Bundler.

      bundle install --path vendor/bundle

3. Start server.

      bundle exec ruby ./slow.rb

4. Make a request using cURL.

      curl "http://${remote_host}:5000/1s" > /dev/null

You can specify a request time in the form of seconds or minutes, like so:

- `/22s` This would delay the request by 22 seconds
- `/4m` This would delay the request by 4 minutes
- `/260s` This would delay the request by 260 seconds
