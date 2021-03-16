#!/bin/bash
/usr/bin/git remote remove github || echo "no previous github exists"
/usr/bin/git remote add github git@github.com:jamesliulondon/bench3-shared-libraries.git || echo "failed to add github"