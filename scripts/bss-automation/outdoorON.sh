#!/bin/bash

# Outdoor ON control

echo -n -e "\x02\x8c\x00\x00\x00\x1e\x92\x03" | nc 10.120.24.40 1023

# EOF

