//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Service
    {
        //Private Member Variables
        private int serviceId;
        private int customerId;
        private String serviceDate;
        private String completionDate;
        private float serviceCost;
        private String serviceType;


        //Static Member Variables
        public int serviceCount;
        Service[] serviceArray;

        //Constructor
        public Service (int serviceId, int customerId, String serviceDate, String completionDate, float serviceCost, String serviceType)
        {
            this.serviceId = serviceId;
            this.customerId = customerId;
            this.serviceId = serviceId;
            this.customerId = customerId;
            this.serviceDate = serviceDate;
            this.completionDate = completionDate;
            this.serviceCost = serviceCost;
            this.serviceType = serviceType;
        }

        //Methods (Getters and Setters)
        public int ServiceId
        {
            get { return serviceId; }
            set { this.serviceId = value; }
        }
        public int CustomerId
        {
            get { return customerId; }
            set { this.customerId = value; }
        }
        public String ServiceDate
        {
            get { return serviceDate; }
            set { this.serviceDate = value; }
        }
        public String CompletionDate
        {
            get { return completionDate; }
            set { this.completionDate = value; }
        }
        public float ServiceCost
        {
            get { return serviceCost; }
            set { this.serviceCost = value; }
        }
        public String ServiceType
        {
            get { return serviceType; }
            set { this.serviceType = value; }
        }
       
    }
}