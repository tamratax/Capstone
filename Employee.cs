//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Employee
    {
        //Private Member Variables
        private int employeeId;
        private String empFirstName;
        private String empLastName;

        //Static Member Variables
        public int employeeCount;
        Employee[] employeeArray;

        //Constructors
        public Employee(int employeeId, String empFirstName, String empLastName)
        {
            this.employeeId = employeeId;
            this.empLastName = empLastName;
            this.empFirstName = empFirstName;

        }

        //Methods (Getters and Setters)
        public int EmployeeId
        {
            get { return employeeId; }
            set { this.employeeId = value; }
        }

        public String EmpFirstName
        {
            get { return empFirstName; }
            set { this.empFirstName = value; }
        }

        public String EmpLastName
        {
            get { return empLastName; }
            set { this.empLastName = value; }
        }

       
    }
}