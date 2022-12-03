#!/bin/bash

# Kill the Espanso process
killall -9 espanso

# Wait for 1 second
sleep 1

# Restart the Espanso process
espanso start
