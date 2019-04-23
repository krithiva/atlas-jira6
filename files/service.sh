#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

/opt/jira/bin/start-jira.sh -fg
