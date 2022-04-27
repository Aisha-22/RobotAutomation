
import  os, json, yaml
from testrail import *


class TestRailLibrary(object):

    def load_config_file(self, filepath):
        try:
            with open(filepath, 'r') as stream:
                global yamlobj
                yamlobj = yaml.load(stream)
                print(yamlobj)
        except:
            print('Failed to load config file')

    def create_test_run(self):
        client = APIClient('https://ayommi.testrail.io')
        client.user = 'siyanda.ndzuzo@mmiholdings.co.za'
        client.password = 'Lordoftherings712'
        case = client.send_post('add_run/6',
                                            {
                                                "suite_id": 18,
                                                "name": "Robot Framework Test Run",
                                                "assignedto_id": 6,
                                                "include_all": False,
                                                "case_ids": yamlobj['testCaseId']
                                            }
                                )
        return str(case)

    def create_test_run_and_return_id(self):
        client = APIClient(yamlobj["hostUrl"])
        client.user = yamlobj["username"]
        client.password = yamlobj["password"]
        uri = "add_run/" + yamlobj["projectId"].__str__()
        case = client.send_post(uri,
                                            {
                                                "suite_id": yamlobj["suiteId"],
                                                "name": yamlobj["runName"],
                                                "assignedto_id": yamlobj["assignedToId"],
                                                "include_all": False,
                                                "case_ids": yamlobj["testCaseId"]
                                            }
                                )
        case = case.get("id")
        return str(case)



    def create_test_run_and_return_id(self, subSystem,countryCode,env):
        client = APIClient(yamlobj["hostUrl"])
        client.user = yamlobj["username"]
        client.password = yamlobj["password"]
        uri = "add_run/" + yamlobj["projectId"].__str__()
        case = client.send_post(uri,
                                            {
                                                "suite_id": yamlobj["suiteId"],
                                                "name": yamlobj[subSystem][countryCode]["runName"] + "  (" + env + ")",
                                                "assignedto_id": yamlobj["assignedToId"],
                                                "include_all": False,
                                                "case_ids": yamlobj[subSystem][countryCode]["testCaseId"]
                                            }
                                )
        case = case.get("id")
        return str(case)


    def add_test_case_results(self, testrunid):
        print(testrunid)
        tempvar = testrunid
        client = APIClient('https://ayommi.testrail.io')
        client.user = 'siyanda.ndzuzo@mmiholdings.co.za'
        client.password = 'Lordoftherings712'
        uri = "add_results_for_cases/" + testrunid
        print(uri)
        case = client.send_post(uri,
                                    {
                                        "results": [
                                            {
                                                "case_id": 70,
                                                "status_id": 5,
                                                "comment": "This test failed"
                                            },
                                            {
                                                "case_id": 71,
                                                "status_id": 1,
                                                "comment": "This test passed"
                                            },
                                            {
                                                "case_id": 72,
                                                "status_id": 1,
                                                "comment": "This test passed"
                                            }
                                        ]
                                    }
                                )
        return str(case)

    def add_test_case_results_body(self, testrunid, resultdata):
        client = APIClient(yamlobj["hostUrl"])
        client.user = yamlobj["username"]
        client.password = yamlobj["password"]
        uri = "add_results_for_cases/" + testrunid
        postdata = "[" + resultdata + "]"
        postdatajson = json.loads(postdata)
        case = client.send_post(uri,  {"results": postdatajson})
        return str(case)

    def close_test_run(self, testrunid):
        client = APIClient(yamlobj["hostUrl"])
        client.user = yamlobj["username"]
        client.password = yamlobj["password"]
        uri = "close_run/" + testrunid
        case = client.send_get(uri)
        return str(case)