#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	maven \
	openjdk-21-jdk-headless \
	wget

mkdir '/opt/freemarker-generator'
pushd '/opt/freemarker-generator'
git clone 'https://github.com/apache/freemarker-generator.git' 'a4a3fcd'
pushd 'a4a3fcd'
# This builds just the CLI (e.g., not the Maven plugin too).
mvn package -T 8C -pl 'freemarker-generator-cli' -am -DskipTests
popd; popd

cat > '/usr/bin/freemarker' <<- 'EOF'
	java -cp "/opt/freemarker-generator/a4a3fcd/freemarker-generator-cli/target/appassembler/lib/*" org.apache.freemarker.generator.cli.Main "$@"
	EOF

chmod +x '/usr/bin/freemarker'
