from python import Python
from .interfaces import Headers

struct HttpClient:
    var requests: PythonObject
    var session: PythonObject

    fn __init__(inout self) raises:
        self.requests = Python.import_module("requests")
        self.session = self.requests.Session()

    fn get(inout self, url: String, headers: Headers, timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.get(url, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn post(inout self, url: String, data: PythonObject, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.post(url, json=data, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn put(inout self, url: String, data: PythonObject, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.put(url, json=data, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn delete(inout self, url: String, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.delete(url, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn head(inout self, url: String, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.head(url, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn options(inout self, url: String, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.options(url, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn patch(inout self, url: String, data: PythonObject, headers: Headers = Headers(), timeout: Float32 = 10.0) raises -> PythonObject:
        var response = self.session.patch(url, json=data, headers=headers.to_python_object(), timeout=timeout)
        response.raise_for_status()
        return response

    fn set_auth(inout self, username: String, password: String) raises:
        self.session.auth = (username, password)