# Use an official Elasticsearch runtime as a parent image
FROM docker.elastic.co/elasticsearch/elasticsearch:8.2.3

# Set the working directory in the container
WORKDIR /usr/share/elasticsearch

# Create a temporary directory for the plugin
RUN mkdir -p /usr/share/elasticsearch/temp

# Copy the elasticsearch-analysis-ik plugin package to the temporary directory
COPY elasticsearch-analysis-ik-8.2.3.zip /usr/share/elasticsearch/temp/

# Install the IK analysis plugin from the temporary directory
RUN bin/elasticsearch-plugin install -b file:///usr/share/elasticsearch/temp/elasticsearch-analysis-ik-8.2.3.zip

# Remove the temporary directory after the plugin is installed
RUN rm -rf /usr/share/elasticsearch/temp

# Expose the necessary ports
EXPOSE 9200 9300

# Command to run Elasticsearch
CMD ["bin/elasticsearch"]
