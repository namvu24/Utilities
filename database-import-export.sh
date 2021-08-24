output_file=file
source_table=dbo.source_table
target_table=dbo.target_table
source_db=source_db
target_db=target_db
source_server=source_server.database.windows.net
target_server=target_server.database.windows.net
user=namvh89@gmail.com

bcp $source_table out $output_file -n -S $source_server -d $source_db -G -U $user

bcp $target_table in $output_file -n -S $target_server -d $target_db -G -U $user