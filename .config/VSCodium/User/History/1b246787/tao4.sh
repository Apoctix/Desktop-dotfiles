#!/bin/bash
sensors | grep -m 1 'Package id 0:' | awk '{print $4}'
