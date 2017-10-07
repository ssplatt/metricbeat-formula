# metricbeat-formula
Reference: https://www.elastic.co/guide/en/beats/metricbeat/current/index.html

Ship system metrics to Elasticsearch.

# Contributing
Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
brew install cask
brew cask install vagrant
```

```
cd <formula dir>
bundle install
```
or
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge default
```

Run a converge on all suites:
```
kitchen converge
```
