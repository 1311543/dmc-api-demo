# Api demo with Flask

Requisitos:
* Python 3.7
* Dependencias en requirements.txt


Dependencias:
```
python3 -m venv myenv
source myenv/bin/activate
./dependencies.sh
```

Ejecutando app:
```
./start.sh
```

Probando:
```
curl localhost:8080/todos/
curl localhost:8080/todos/todo3
```

Usando Docker:
```
./docker-build.sh
./docker-build.sh v13 # opcional
```

Levantando con Docker Compose:
```
docker-compose up
```
