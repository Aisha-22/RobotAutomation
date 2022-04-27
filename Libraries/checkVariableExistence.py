from robot.api.deco import keyword

@keyword(name="Check If Variable Exists")
def returnVariableExistanceStatus(var):
    if var():
        # print(str(locals()))
        return var
    else:
        print(False)
        return var

@keyword(name="Log Out Global Variables")
def returnGlobalVariables():
    print(locals())

def logAllLocals():
    print(locals())
    
logAllLocals()