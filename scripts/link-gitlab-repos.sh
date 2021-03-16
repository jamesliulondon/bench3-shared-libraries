#!/bin/bash
/usr/bin/git remote remove gitlab || echo "no previous github exists"
/usr/bin/git remote add gitlab http://${HOSTNAME}:18080/jamesliulondon/bench3-shared-libraries.git || echo "failed to add github"