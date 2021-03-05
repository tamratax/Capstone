//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Customer
    {

        //Private Member Variables
        private int customerId; 
        private String firstName;
        private String lastName;
        private String phoneNumber;
        private String email;
        private String streetAddress;
        private String city;
        private String state;
        private float totalEarnings;

        //Static Member Variables
        public int customerCount;
        Customer[] customerArray;

        //Constructor
        public Customer (int customerId, String firstName, String lastName, String phoneNumber, String email, String streetAddress, String city, String state, float totalEarnings)
        {
            this.customerId = customerId;
            this.firstName = firstName;
            this.lastName = lastName;
            this.phoneNumber = phoneNumber;
            this.email = email;
            this.streetAddress = streetAddress;
            this.city = city;
            this.state = state;
            this.totalEarnings = totalEarnings;
        }
        //Methods (Getters and Setters)
        public int CustomerId
        {
            get { return customerId; }
            set { this.customerId = value; }
        }

        public String FirstName
        {
            get { return firstName; }
            set { this.firstName = value; }
        }

        public String LastName
        {
            get { return lastName; }
            set { this.lastName = value; }
        }

        public String PhoneNumber
        {
            get { return phoneNumber; }
            set { this.phoneNumber = value; }
        }

        public String Email
        {
            get { return email; }
            set { this.email = value; }
        }

        public String StreetAddress
        {
            get { return streetAddress; }
            set { this.streetAddress = value; }
        }

        public String City
        {
            get { return city; }
            set { this.city = value; }
        }

        public String State
        {
            get { return state; }
            set { this.state = value; }
        }

        public float TotalEarnings
        {
            get { return totalEarnings; }
            set { this.totalEarnings = value; }
        }

    }
}