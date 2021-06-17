#!/bin/bash

echo "=========================================================================="
echo "Applying of iptables rules started..."
echo "=========================================================================="

ListOfRules=$(ls ./rules.d/ | grep .sh)
ListOfPorts=$(ls ./ports.d/ | grep .sh)

for rule in $ListOfRules
do
        /bin/bash ./rules.d/$rule
done

for port in $ListOfPorts
do
        /bin/bash ./ports.d/$port
done

echo "=========================================================================="
echo "All done!!!"
echo "=========================================================================="

exit