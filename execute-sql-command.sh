sql_server=sqlserver.database.windows.net
user=sa
password=password
db=master
command="SELECT * FROM dbo.test"

# loop until SQL is ready
# do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..60};
do
    sqlcmd -S $sql_server  -U $user -P $password -Q "SELECT Name FROM SYS.DATABASES"
    if [ $? -eq 0 ]
    then
        echo "sql server ready"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done

sqlcmd -l 300 -S $sql_server -U $user -P $password -d $db -Q $command