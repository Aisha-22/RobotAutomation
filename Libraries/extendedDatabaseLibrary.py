import pymssql


class extendedDatabaseLibrary(object):
    ROBOT_LIBRARY_VERSION = 1.0

    def Get_Engagement_Data_From_Database(selectSlqQuery):
        """Connect to database and extract data """

        server = 'bmnuh47chb.database.secure.windows.net'
        database = 'mmazwesqldbayocotedivoire-test'
        username = 'ayotentant@bmnuh47chb'
        password = '4x|_sDCsGt#AzkHR||"b'

        cnxn = pymssql.connect(server, username, password, database)
        cursor = cnxn.cursor()
        cursor.execute(selectSlqQuery)
        # ursor.execute("select * from Users")
        row = cursor.fetchone()
        while row:
            print(str(row[0]) + " " + str(row[1]))
            row = cursor.fetchone()
