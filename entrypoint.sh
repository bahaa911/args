SMOKE_RESULTS="result.csv"
LOG_FILE="log.log"
JMETER_SCRIPT_FILE=$1
jmeter -n -t $JMETER_SCRIPT_FILE \
    -l /data/$SMOKE_RESULTS -j /data/$LOG_FILE

echo "--------------- execution done --------------"

echo "--------------- check Logs below --------------"
