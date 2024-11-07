#!/usr/bin/env bash

BIBFILE=$1

cat  << EOF
---
bibliography: $BIBFILE
nocite: '@*'
---
EOF
