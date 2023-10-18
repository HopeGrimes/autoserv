#!/bin/bash

# sunday AM preset control

echo -n -e "\x02\x8c\x00\x00\x00\x21\xad\x03" | nc 10.120.24.40 1023

# EOF

