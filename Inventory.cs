//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Inventory
    {
        //Private Member Variables
        private int itemId { get; set; }
        private String itemDescription;
        private float itemCost;
        private String itemDate;

        //Static Member Variables
        public int itemCount;
        Inventory[] itemArray;

        //Constructor
        public Inventory (int itemID, String itemDescription, float itemCost, String itemDate)
        {
            this.itemId = itemId;
            this.itemDescription = itemDescription;
            this.itemCost = itemCost;
            this.itemDate = itemDate;
        }

        //Methods (Getters and Setters)
        public String ItemDescription
        {
            get { return itemDescription; }
            set { this.itemDescription = value; }
        }
        public float ItemCost
        {
            get { return itemCost; }
            set { this.itemCost = value; }
        }
        public String ItemDate
        {
            get { return itemDate; }
            set { this.itemDate = value; }
        }
    }
}