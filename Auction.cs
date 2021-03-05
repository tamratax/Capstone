//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Auction : Service
    {
        //Private Member Variables
        private int employeeId { get; set; }

        //Constructor
        public Auction(int employeeId, int serviceId, int customerId, String serviceDate, String completionDate, float serviceCost, String serviceType) 
            : base (serviceId, customerId, serviceDate, completionDate, serviceCost, serviceType)
        {
            this.employeeId = employeeId;
        }

    }
}