#!/bin/bash
set -x
WORKUNITS_DIR=$CEPH_BASE/qa/workunits

sudo rados --striper
RETURN_VALUE=$?
set -e
test "$RETURN_VALUE" != 0
sudo rados --striper 2>&1 | tee test-striper-output
grep "unrecognized command --striper" test-striper-output

