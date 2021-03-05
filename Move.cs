//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Move : Service
    {

        //Private Member Variables
        private String originStreet;
        private String originCity;
        private String originState;
        private String destinationStreet;
        private String destinationCity;
        private String destinationState;
        private String destinationTime;
        private float gasExpense;
        private float miscExpense;

        //Constructor
        public Move(String originStreet, String originCity, String originState, String destinationStreet, 
            String destinationCity, String destinationState, String destinationTime, float gasExpense, float miscExpense, 
            int serviceId, int customerId, String serviceDate, String completionDate, float serviceCost, String serviceType)
            : base(serviceId, customerId, serviceDate, completionDate, serviceCost, serviceType)
        {
            this.originStreet = originStreet;
            this.originCity = originCity;
            this.originState = originState;
            this.destinationStreet = destinationStreet;
            this.destinationCity = destinationCity;
            this.destinationState = destinationState;
            this.destinationTime = destinationTime;
            this.gasExpense = gasExpense;
            this.miscExpense = miscExpense;
        }

        //Methods (Getters and Setters)
        public String OriginStreet
        {
            get { return originStreet; }
            set { this.originStreet = value; }
        }
        public String OriginCity
        {
            get { return originCity; }
            set { this.originCity = value; }
        }
        public String OriginState
        {
            get { return originState; }
            set { this.originState = value; }
        }
        public String DestinationStreet
        {
            get { return destinationStreet; }
            set { this.destinationStreet = value; }
        }
        public String DestinationCity
        {
            get { return destinationCity; }
            set { this.destinationCity = value; }
        }
        public String DestinationState
        {
            get { return destinationState; }
            set { this.destinationState = value; }
        }
        public String DestinationTime
        {
            get { return destinationTime; }
            set { this.destinationTime = value; }
        }
        public float GasExpense
        {
            get { return gasExpense; }
            set { this.gasExpense = value; }
        }
        public float MiscExpense
        {
            get { return miscExpense; }
            set { this.miscExpense = value; }
        }

    }
}