import openpyxl

# Creating object of the workbook class
wk = openpyxl.Workbook()

# Fetching and writing data to the excel sheet
sh = wk.active
# Fetching and displaying
sh.title = "HelloTestingWorld"
print(sh.title)

# Entering data into the excel sheet
sh['A4'].value = "www.theTestingWorld.com"

wk.save("C:\\Users\\user\\Documents\\MyRobotLearning\\Test1Data.xlsx")
