import json


def main():
    data = {
        "message": "Hello World",
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "hobbies": ["Reading", "Coding", "Hiking"],
        "friends": [{"name": "Jane Doe", "age": 25}, {"name": "Bob Smith", "age": 35}],
        "address": {"street": "123 Main St", "apartment": 4, "country": "USA"},
        "email": "john.doe@example.com",
        "phone": "+1 212 123 4567",
    }
    response = {"status_code": 201, **data}
    return json.dumps(response), 201
