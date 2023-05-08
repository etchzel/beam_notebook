# Apache Beam Interactive Notebook

Dockerized jupyter notebook with requirements installed to run apache beam interactively.

Helpful for development of apache beam (python) pipelines in a REPL manner.

# Running the notebook

Simply run:

```bash
docker compose up -d
```

Then access the notebook on http://localhost:8888/

When prompted for token, enter the value you set for `JUPYTER_TOKEN` on `.env` file.

# Configuration

To change the port (in case port 8888 is used already), replace the following on `docker-compose.yaml`

```yaml
ports:
  - "<YOUR_SPECIFIED_PORT>:8888"
```

To change the token for authentication, replace the following on `.env`

```bash
JUPYTER_TOKEN=<YOUR_SPECIFIED_TOKEN>
```