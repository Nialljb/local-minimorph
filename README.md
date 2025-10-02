echo "Available CPUs: $(sysctl -n hw.ncpu)"  # macOS

display container stats
docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"