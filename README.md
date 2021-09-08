# docker-homer

HOMER (Hypergeometric Optimization of Motif EnRichment) is a suite of tools for Motif Discovery and next-gen sequencing analysis.

## How to Run

```bash
docker run -it --rm homer:4.11
```

## Build Container Image

```bash
./build.sh
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [SCING](https://github.com/hisplan/scing)):

```bash
./push.sh
```
