export BASEPATH="/docker-entrypoint-initdb.d"
echo "${mysql[@]}"
echo 権限を作成します。
"${mysql[@]}" < $BASEPATH/grant_db.sql_
echo テーブルを作成します。
echo "USE "$MYSQL_DATABASE";" | "${mysql[@]}"
"${mysql[@]}" < $BASEPATH/create_table.sql_
echo 初期データを作成します。
"${mysql[@]}" < $BASEPATH/insert_init_data.sql_