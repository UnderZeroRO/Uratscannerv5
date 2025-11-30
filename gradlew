#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a symlink
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls -ld "$PRG"
    link=$(expr "$PRG" : '.*-> \(.*\)$')
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=$(dirname "$PRG")"/$link"
    fi
done
SAVED="$(pwd)"
cd "$(dirname "$PRG")/" >/dev/null
APP_HOME="$(pwd -P)"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != maximum.
MAX_FD="maximum"

warn () {
    echo "$*"
} >&2

die () {
    echo "$*"
    exit 1
} >&2

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
pw32=false
nwjs=false
darwin=false
nonstop=false
case "$( uname )" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NWJS* )
    nwjs=true
    ;;
  SunOS*)
    JAVA_HOME=$(dirname "$(dirname "$(readlink -f "$(which javac)")")")
    ;;
esac

# For Cygwin or MSYS, switch paths to Windows format before running java
if [ "$cygwin" = "true" ] -o [ "$msys" = "true" ] ; then
    APP_HOME=$(cygpath --path --mixed "$APP_HOME")
    APP_BASE_NAME=$(cygpath --path --mixed "$APP_BASE_NAME")
fi

if ! command -v java &> /dev/null
then
    die "Gradle requires a Java Runtime, but none was found in your PATH."
fi

# Find java.exe if available, otherwise use java.
if command -v java.exe &> /dev/null ; then
    JAVACMD="java.exe"
else
    JAVACMD="java"
fi

CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
fi

if [ -z "$JAVA_HOME" ] ; then
    warn "JAVA_HOME environment variable is not set"
fi

# initialize classpath exclusion
CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin or MSYS match paths before invoking java
if [ "$cygwin" = "true" ] -o [ "$msys" = "true" ] ; then
    APP_HOME=$(cygpath --path --mixed "$APP_HOME")
    CLASSPATH=$(cygpath --path --mixed "$CLASSPATH")

    JAVACMD=$(cygpath --windows "$JAVACMD")

    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
        CHECK=$(echo "$arg"|egrep -c '^-')                                 # check if the argument is
                                             # a filename (not an option), then quote if needed
        CHECK2=$(echo "$arg"|egrep -c "^-")                                # check again
        if [ "$CHECK" -eq 0 ] && [ "$CHECK2" -eq 0 ] ; then                 # if the argument is a filename
             arg=$(cygpath --windows "$arg")
        fi
        eval "args$i=\$arg"
        i=$(expr $i + 1)
    done
    case $i in
        (0) set -- ;;
        (1) set -- "$args0" ;;
        (2) set -- "$args0" "$args1" ;;
        (3) set -- "$args0" "$args1" "$args2" ;;
        (4) set -- "$args0" "$args1" "$args2" "$args3" ;;
        (5) set -- "$args0" "$args1" "$args2" "$args3" "$args4" ;;
        (6) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" ;;
        (7) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" ;;
        (8) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" ;;
        (9) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" "$args8" ;;
    esac
fi

# Escape application args
save () {
    for var in "$@"
    do
        ESCAPED_ARGS="$ESCAPED_ARGS \"$var\""
    done
    echo "$ESCAPED_ARGS"
}
APP_ARGS=$(save "$@")
MAIN_CLASS='org.gradle.wrapper.GradleWrapperMain'

# Collect all arguments for the java command, stacking in reverse order:
#   * args from the command line
#   * the main class name
#   * -classpath
#   * the classpath
#   * -D...appname settings
#   * --module-path (only if needed)
#   * DEFAULT_JVM_OPTS, JAVA_OPTS, and GRADLE_OPTS environment variables.

# For Cygwin or MSYS, switch paths to Windows format before running java
if "$cygwin" = true || "$msys" = true ; then
    APP_HOME=$(cygpath --path --mixed "$APP_HOME")
    CLASSPATH=$(cygpath --path --mixed "$CLASSPATH")

    JAVACMD=$(cygpath --windows "$JAVACMD")

    # We build the pattern for arguments to be converted via cygpath
    ROOTDIRSRAW=$(find -L / -maxdepth 3 -type d -name java >/dev/null 2>&1 && find -L / -maxdepth 3 -type d -name java | head -1 | xargs -0 dirname 2>/dev/null)
    # Add a user-defined pattern to the cygpath arguments
    if [ "$GRADLE_CYGWIN_HOME" != "" ] ; then
        ROOTDIRSRAW="$ROOTDIRSRAW|$GRADLE_CYGWIN_HOME"
    fi
    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
        CHECK=$(echo "$arg"|egrep -c '^-')                                 # check if the argument is
                                             # a filename (not an option), then quote if needed
        CHECK2=$(echo "$arg"|egrep -c "^-")                                # check again
        if [ "$CHECK" -eq 0 ] && [ "$CHECK2" -eq 0 ] ; then                 # if the argument is a filename
             arg=$(cygpath --windows "$arg")
        fi
        eval "args$i=\$arg"
        i=$((i+1))
    done
    case $i in
        (0) set -- ;;
        (1) set -- "$args0" ;;
        (2) set -- "$args0" "$args1" ;;
        (3) set -- "$args0" "$args1" "$args2" ;;
        (4) set -- "$args0" "$args1" "$args2" "$args3" ;;
        (5) set -- "$args0" "$args1" "$args2" "$args3" "$args4" ;;
        (6) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" ;;
        (7) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" ;;
        (8) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" ;;
        (9) set -- "$args0" "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" "$args8" ;;
    esac
fi

# Collect all arguments for the java command:
#   * DEFAULT_JVM_OPTS, JAVA_OPTS, GRADLE_OPTS, and appname settings are in JAVA_OPTS.
#   * appname is stored in APP_BASE_NAME
#   * Automatic appname from the jar name: extract file name without path and extension.

set -- "$JAVACMD" "$JAVA_OPTS" $DEFAULT_JVM_OPTS \
        -classpath "$CLASSPATH" \
        org.gradle.wrapper.GradleWrapperMain \
        "$@"

# Use "xargs" to parse quoted args.
#
# With -n1 it outputs one arg per line, when -0 it uses \0 as delimiter and the end of file is marker (this is suitable for xargs which ends at NUL character).
#
# e.g. to see how xargs parses your commands, you can use:
#     - example: mv *Controller.java checked/
#     - printf '%s\n' *.java | xargs -I {} mv {} checked/
#     - xargs -rn1 < read.txt
# shellcheck disable=SC2086,SC2090 # we want word splitting of $DEFAULT_JVM_OPTS and $JAVA_OPTS.

exec "$@"
