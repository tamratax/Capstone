//Coded By: Stuart Walker & Aaron Walsh
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WalkerS_Lab1Part3
{
    public class Equipment
    {
        //Private Member Variables
        private int equipmentId { get; set; }
        private String equipmentType;

        //Static Member Variables
        public int equipmentCount;
        Equipment[] equipmentArray;

        //Constructor
        public Equipment (int equipmentID, String equipmentType)
        {
            this.equipmentId = equipmentId;
            this.equipmentType = equipmentType;
        }
        //Methods (Getters and Setters)
        public String EquipmentType
        {
            get { return equipmentType; }
            set { this.equipmentType = value; }
        }
    }
}