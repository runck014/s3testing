# MSI Tier 2 Speedtest

These scripts do a speedtest of read-write from MSI tier 2 storage. Usage:

1. run `get_test_data.sh`
2. update `s3speedtest.sh` as needed
3. run `s3speedtest.sh`
4. Cleanup bucket manually `s3cmd rm s3://test-bucket/filename`
