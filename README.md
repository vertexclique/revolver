![Revolver](img/revolver.png)

# REVOLVER

Service that reads messages from different kafka topics and insert related metrics into Graphite

## Installation

Inside project directory

```bash
$ stack setup
$ stack build
$ stack exec revolver -- -c CONFIG_FILE_PATH
```

## Configuration

Configuration is made by config file which is passed in with first run:
It contains:

* Kafka host addresses
* topic <-> metrics mappings.
* StatsD backend host addresses
