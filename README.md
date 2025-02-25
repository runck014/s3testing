# MSI Tier 2 Speedtest

These scripts do a speedtest of read-write from MSI tier 2 storage. Usage:

1. run `get_test_data.sh`
2. update `s3speedtest.sh` as needed
3. run `s3speedtest.sh`
4. Cleanup bucket manually `s3cmd rm s3://test-bucket/filename`

# Results on February 25, 2025
```
runck014@ahl02 [~/tmp/s3testing] % bash s3speedtest.sh 
Creating a 438MB test file...
438+0 records in
438+0 records out
459276288 bytes (459 MB, 438 MiB) copied, 0.605562 s, 758 MB/s
Testing copy within Tier 1 storage...
cp: '4342-14-03.las' and '/users/2/runck014/tmp/s3testing/4342-14-03.las' are the same file
Time taken: 3 ms
Testing copy to Tier 2 storage...
upload: '4342-14-03.las' -> 's3://test-bucket-runck/4342-14-03.las'  [1 of 1]
 459276288 of 459276288   100% in    3s   115.67 MB/s  done
Time taken: 5200 ms
Test completed.

```
