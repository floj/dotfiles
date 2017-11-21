# COMMON_JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.security.egd=file:/dev/./urandom"
COMMON_JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"
export JAVA_OPTS="${COMMON_JAVA_OPTS}"

#
# Maven
#
#
if [[ -d "$HOME/programs/apache-maven/current" ]]; then
  export MAVEN_HOME="$HOME/programs/apache-maven/current"
  export MAVEN_OPTS="-Xms128m -Xmx2g $COMMON_JAVA_OPTS"
  path+=($MAVEN_HOME/bin)
  alias mvn='mvn -B' # use batch mode to supress download progress
fi

