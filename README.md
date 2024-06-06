# `trainmap-docker`
This is just me trying to implement my trainmap project as a Docker image.

# How to
- Add your feeds to the `loader_config.json` file
- `docker build` and `docker run` the image with whatever mapping you want to port 80

# Legal
- This base version uses the French [SNCF TER GTFS feed](https://ressources.data.sncf.com/explore/dataset/sncf-ter-gtfs/information/), which is available under the ODbL License
- You should probably read the terms & conditions of the feeds you're using and credit them if necessary