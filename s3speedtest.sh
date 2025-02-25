#!/bin/bash

# Define variables
TEST_FILE="4342-14-03.las"
FILE_SIZE_MB=438  # Size of the test file in megabytes
TIER1_DIR=$PWD
TIER2_BUCKET="s3://test-bucket-runck"

# Create a test file of specified size
echo "Creating a ${FILE_SIZE_MB}MB test file..."
dd if=/dev/zero of=${TEST_FILE} bs=1M count=${FILE_SIZE_MB}

# Function to measure time taken for a command
measure_time() {
    local start_time=$(date +%s%N)
    $1
    local end_time=$(date +%s%N)
    local duration=$((($end_time - $start_time)/1000000))
    echo "Time taken: ${duration} ms"
}

# Test copying within Tier 1 storage
echo "Testing copy within Tier 1 storage..."
measure_time "cp ${TEST_FILE} ${TIER1_DIR}/"

# Test copying to Tier 2 storage
echo "Testing copy to Tier 2 storage..."
measure_time "s3cmd put ${TEST_FILE} ${TIER2_BUCKET}/"

# Clean up
rm -f ${TEST_FILE}
echo "Test completed."
