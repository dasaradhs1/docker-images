# https://grafana.com/docs/installation/docker/
#
# for using "--link prometheus...." - pls, start container with prometheus: ../prometheus/prometheus.sh
docker run --rm \
        --publish 9091:3000 \
	--env GF_SECURITY_ADMIN_PASSWORD=admin \
	--volume `pwd dirname $0`/config:/etc/grafana/provisioning \
        --volume `pwd dirname $0`/data:/var/lib/grafana \
	--name grafana \
	--link prometheus:prometheus-host \
	grafana/grafana 
