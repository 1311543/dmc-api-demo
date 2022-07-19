Api demo with Flask

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
