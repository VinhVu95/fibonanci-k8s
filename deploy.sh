docker build -t vinhvu0495/multi-client:latest -t vinhvu0495/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vinhvu0495/multi-server:latest -t vinhvu0495/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vinhvu0495/multi-worker:latest -t vinhvu0495/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push vinhvu0495/multi-client:latest
docker push vinhvu0495/multi-client:$SHA
docker push vinhvu0495/multi-server:latest
docker push vinhvu0495/multi-server:$SHA
docker push vinhvu0495/multi-worker:latest
docker push vinhvu0495/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vinhvu0495/multi-server:$SHA
kubectl set image deployments/client-deployment client=vinhvu0495/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=vinhvu0495/multi-worker:$SHA