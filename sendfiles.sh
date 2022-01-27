worker=$(docker ps --format "{{.Names}}" | grep airflow-worker)
echo $worker
mkdir fromlocal
cd fromlocal

docker exec $worker bash -c "mkdir fromlocal"

csvlist=$(ls)
echo $csvlist

for i in $csvlist; do 
    echo $i
    docker cp $i $worker:opt/airflow/fromlocal/$i
done