from router import router
def application(req, resp):
    pathInfo = req['PATH_INFO ']
    requestMethod = req['REQUEST_METHOD']
    handler = router.route(pathInfo, requestMethod)
    resp('200 OK', [('content-type','text/html')])
    return handler.handle()