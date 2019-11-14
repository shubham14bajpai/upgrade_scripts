# upgrade_scripts

The scripts help automate the process of upgrading multiple resources in one job.
The script first creates UpgradeTask CR for each resource and then launches a job to upgrade all of them.
The fields and labels for the resource UpgradeTask CR are hard coded for now.  

**Note: Make sure the image-prefix and image-tags are empty if you don't want any custom images**

## Example
```
./cstor_volume_upgrade.sh 
Please give the list of cstor volume to be upgraded: pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc
pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc
upgradetask.openebs.io/upgrade-cstor-volume-pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc created
pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc
upgradetask.openebs.io/upgrade-cstor-volume-pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc created
job.batch/cstor-volume-upgrade created

```

## Sample Logs

```
I0905 11:26:09.165289       1 resource.go:138] Upgrading to 1.2.0-RC1
I0905 11:27:04.522684       1 cstor_volume_upgrade.go:140] target deployment pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc-target patched
I0905 11:27:04.543812       1 helper.go:173] targetservice pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc patched
I0905 11:27:04.566625       1 cstor_volume_upgrade.go:189] cstorvolume pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc patched
I0905 11:27:04.602873       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-2kmj patched
I0905 11:27:04.650616       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-mw5o patched
I0905 11:27:04.677903       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-waq3 patched
I0905 11:27:04.686345       1 cstor_volume_upgrade.go:562] Upgrade Successful for cstor volume pvc-c282e463-cfc4-11e9-a1cd-42010a8000fc
I0905 11:27:04.695152       1 resource.go:138] Upgrading to 1.2.0-RC1
I0905 11:28:04.850163       1 cstor_volume_upgrade.go:140] target deployment pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc-target patched
I0905 11:28:04.866226       1 helper.go:173] targetservice pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc patched
I0905 11:28:04.885787       1 cstor_volume_upgrade.go:189] cstorvolume pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc patched
I0905 11:28:04.916885       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-2kmj patched
I0905 11:28:04.931852       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-mw5o patched
I0905 11:28:04.948973       1 cstor_volume_upgrade.go:231] cstorvolumereplica pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc-test-sparse-pool-waq3 patched
I0905 11:28:04.959020       1 cstor_volume_upgrade.go:562] Upgrade Successful for cstor volume pvc-d5094678-cfc4-11e9-a1cd-42010a8000fc

```
