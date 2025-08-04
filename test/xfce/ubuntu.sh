#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'color' feature with "greeting": "hello" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

echo "opa trpoa! $(whoami)"
ls -l ~/.vnc
# cat ~/.vnc/passwd

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "default display (ubuntu.sh)" bash -c "echo $DISPLAY | grep ':1'"

# Start the VNC server
echo -e "password\npassword\nn" | tigervncserver -xstartup /usr/bin/xterm
check "check Xtigervnc was started" bash -c "ps aux | grep Xtigervnc"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
