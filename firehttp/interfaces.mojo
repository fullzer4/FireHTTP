from python import PythonObject, Python

struct Headers:
    var headers: Dict[String, String]

    fn __init__(inout self):
        self.headers = Dict[String, String]() 

    fn add(inout self, key: String, value: String):
        self.headers[key] = value
    
    fn to_python_object(self) raises -> PythonObject:
        var py = Python()
        var dict = py.dict()
        for item in self.headers.items():
            dict.__setitem__(item[].key, item[].value)
        return dict
