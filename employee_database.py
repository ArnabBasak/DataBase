import pymysql

"""Open a database connection"""
db = pymysql.connect("localhost","root","library123","employee")

"""prepare the cursor object"""
cursor = db.cursor()

"""execute sql query using execute"""
cursor.execute("select version()")

"""fetching the data"""
data = cursor.fetchone()
print("database version is",data)

"""check if the departments table is present or not"""
cursor.execute("show tables like 'departments'")
department_table = cursor.fetchall()
if not department_table:
    print("The department tables doesn't exist creating one")
    create_table_department = """CREATE TABLE Departments (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL ,
    Budget REAL NOT NULL 
    );"""
    cursor.execute(create_table_department)
else:
    print("department table already exist so dropping it")

"""check if the employees table is present or not"""
cursor.execute("show tables like 'employees'")
employee_table = cursor.fetchall()
if not employee_table:
    print("The employees table doesn't exist creating one")
    create_table_employees = """CREATE TABLE Employees (
   SSN INTEGER PRIMARY KEY NOT NULL,
   Name TEXT NOT NULL ,
   LastName TEXT NOT NULL ,
   Department INTEGER NOT NULL , 
   CONSTRAINT fk_Departments_Code FOREIGN KEY(Department) 
   REFERENCES Departments(Code)
 );"""
    cursor.execute(create_table_employees)
    
else:
    print("table with the same name already exists so dropping it")
    
    

db.close()