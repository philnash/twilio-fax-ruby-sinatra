# 🚨 Deprecated 🚨

[The Programmable Fax API was closed on the 17th December 2021](https://www.twilio.com/changelog/programmable-fax-end-life-one-year-notice), so this example app has been deprecated and archived.

---

# Send and track Faxes with the Twilio Fax API using Sinatra and Ruby

This is an example application that you can use to send and track faxes using the [Twilio Fax API](https://www.twilio.com/docs/fax).

To find out how to build an application like this, read [the blog post on how to send and track faxes with the Twilio Fax API using Sinatra and Ruby](https://www.twilio.com/blog/send-faxes-twilio-fax-api-sinatra-ruby).

## Running the app

You'll need the following to run the app:

* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Bundler](https://bundler.io/) for installing dependencies
* [ngrok](https://ngrok.com/) so we can [expose webhook endpoints in style](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
* [A Twilio account](https://www.twilio.com/try-twilio) with a fax capable number

Then clone the application:

```bash
git clone https://github.com/philnash/twilio-fax-ruby-sinatra.git
cd twilio-fax-ruby-sinatra
```

Install the dependencies:

```bash
bundle install
```

Copy the example config file to `config/env.yml`:

```bash
cp config/env.yml.example config/env.yml
```

Fill in `config/env.yml` with your Twilio Account SID and Auth Token available on [your Twilio console](https://www.twilio.com/console). Enter a fax capable Twilio number from your account as the `FROM_NUMBER`.

Start ngrok to point at port 3000.

```bash
ngrok http 3000
```

Fill in the `URL_BASE` in `config/env.yml` with your ngrok URL.

Start the application:

```bash
bundle exec shotgun config.ru -p 3000
```

Open [localhost:3000](http://localhost:3000) and start sending faxes!