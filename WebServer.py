from wsgiref.simple_server import make_server
from application import application

httpd = make_server('', 8000, application)
print('server http at port 8000!')
httpd.serve_forever()