# Api demo with Flask

Requisitos:
* Python 3.7
* Dependencias en requirements.txt


Dependencias:
```
python3 -m venv myenv
source myenv/bin/activate
pip install -r requirements.txt
```

Ejecutando app:
```
cd src/
export FLASK_APP=api.py
flask run -h 0.0.0.0 -p 8080
```

Probando:
```
curl localhost:8080/todos/
curl localhost:8080/todos/todo3
```

Usando Docker:
```
./docker-build.sh
./docker-build.sh v3 # opcional
```

Levantando con Docker Compose:
docker-compose up
