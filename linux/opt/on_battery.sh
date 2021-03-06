#!/bin/sh

set -e

# Only works with System76 hardware which have the
# System76 ACPI firmware packages installed

# https://www.reddit.com/r/System76/comments/kcqt9o/how_to_enable_and_control_charging_thresholds_on/

# Enable safe charging limits.
echo 0 >/sys/class/power_supply/BAT0/charge_control_start_threshold
echo 100 >/sys/class/power_supply/BAT0/charge_control_end_threshold
echo "Max Charge Enabled - 100%"
