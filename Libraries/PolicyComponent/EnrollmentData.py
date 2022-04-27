from typing import Any


class RwcEnrollment:
    originator: str
    productCode: str
    effectiveDate: str
    agentCode: str
    id: int
    age: int
    dateOfBirth: str
    clientMSISDN: str
    need: str
    termsAndConditionIndicator: bool

    def __init__(self) -> None:
        self.originator = 'USSD Self Service'
        self.productCode = 'aYo Airtime Enabled Insurance'
        self.effectiveDate = '2018-05-01T12:04:02.000Z'
        self.agentCode = ''
        self.id = 1
        self.age = 27
        self.dateOfBirth = '1994-05-01'
        self.clientMSISDN = '233676983789'
        self.need = 'Wholesale Hospital Cash Plan'
        self.termsAndConditionIndicator = True
        self.autoBoosts = []


class AutoBoost:
    boostNeed: str
    boostAmount: Any

    def __init__(self) -> None:
        pass


class Amount:
    amount: float
    currencyCode: str

    def __init__(self, amount, currencyCode) -> None:
        self.amount = amount
        self.currencyCode = currencyCode


class Person:
    name: str
    surname: str
    birthdate: str
    age: int

    def __init__(self) -> None:
        pass