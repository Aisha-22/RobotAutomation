#import uuid

class GenerateGUID(object):
    ROBOT_LIBRARY_VERSION = 1.0
    def generate_uuid(self):
        import uuid
        id = uuid.uuid4()
        return str(id)

