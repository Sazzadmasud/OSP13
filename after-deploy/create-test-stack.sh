#sudo yum -y install wget
#wget -nc https://download.cirros-cloud.net/0.3.4/cirros-0.3.4-i386-disk.img

# Can't prevent duplicates (maybe need to use a project?), so deleting to prevent this
openstack image delete cirros
openstack image create --disk-format qcow2 --container-format bare --file cirros-0.3.4-i386-disk.img cirros
openstack flavor create --ram 1024 --disk 40 --vcpus 4 --public test
sleep 10

## Using stack to spin up instance
openstack stack create -f yaml -t test-stack.yaml test-stack
sleep 5
openstack stack show test-stack
openstack stack resource list test-stack
