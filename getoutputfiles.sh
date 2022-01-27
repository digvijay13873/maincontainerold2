mkdir fromdocker
worker=$(docker ps --format "{{.Names}}" | grep airflow-worker)
echo $worker
docker exec $worker bash -c "mkdir fromdocker"

csvlist=$(docker exec $worker bash -c "cd fromdocker; ls" | grep .csv)
echo $csvlist


for i in $csvlist; do 
    echo $i
    docker cp $worker:opt/airflow/fromdocker/$i fromdocker/$i
done