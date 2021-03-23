<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AuctionInventory.aspx.cs" Inherits="Lab3.ItemRecieval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Table ID="Table1" runat="server">
       
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCustomerName" runat="server" Text="Customer Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DDLCust"
                    DataSourceID="dtasrcCustomerList"
                    DataTextField="CustomerName"
                    DataValueField="CustomerID"
                    runat="server"
                    OnSelectedIndexChanged="DDLCust_SelectedIndexChanged"
                    OnDataBound="DDLCust_DataBound"
                    AutoPostBack="true">
                </asp:DropDownList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvCustomerList"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DDLCust"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
            <%--  <asp:TableRow>
            <asp:TableCell>
                <asp:Label
                    ID="LblPhoneNumber"
                    runat="server"
                    Text="Home Phone: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="5">
                <asp:TextBox
                    ID="TxtPhoneNumber"
                    runat="server"
                    Text=""></asp:TextBox>

                <asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text=" Cell Phone: "></asp:Label>

                <asp:TextBox
                    ID="TxtCellPhone"
                    runat="server"
                    Text=""></asp:TextBox>

                <asp:Label
                    ID="LblWorkPhone"
                    runat="server"
                    Text=" Work Phone: "></asp:Label>

                <asp:TextBox
                    ID="TxtWorkPhone"
                    runat="server"
                    Text=""></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>--%>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblType"
                    runat="server"
                    Text="Select Service: ">
                </asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList
                    ID="DDLType"
                    runat="server"
                    OnDataBound="DDLType_DataBound"
                    AutoPostBack="true" 
                    OnSelectedIndexChange="DDLType_SelectedIndexChanged"
                    >
                </asp:DropDownList>
            </asp:TableCell>
             <asp:TableCell>
                <asp:RequiredFieldValidator
                    ID="RfvSeriveTicket"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DDLType"
                    Text="Please Choose A Valid Option"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:RadioButton ID="PickupBtn" runat="server" Text="Pick Up"  GroupName="RecievalOptions" OnCheckedChanged="PickupBtn_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
            <asp:TableCell>
               <asp:RadioButton ID="BringInBtn" runat="server" Text="Bring In" GroupName="RecievalOptions" OnCheckedChanged="BringInBtn_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
        </asp:TableRow>
        <%-- <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="LblPCA" runat="server" Text="Primary Contact Address" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblStreet"
                    runat="server"
                    Text="Street: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtStreet"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server"
                    ControlToValidate="TxtStreet"
                    Text="Field Cannot Be Blank"
                    ForeColor="Red"
                    ValidationGroup="CreateAddress"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblCity"
                    runat="server"
                    Text="City: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCity"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblState"
                    runat="server"
                    Text="State: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtState"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblZip"
                    runat="server"
                    Text="Zip Code: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtZip"
                    runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>--%>
              
           <asp:TableRow>
               <asp:TableCell>
                   <asp:Label ID="AddOnLbl" runat="server" Text="Add On?"></asp:Label>
               </asp:TableCell>
            <asp:TableCell>
                <asp:CheckBox ID="ChkBoxAddOn" runat="server" />
            </asp:TableCell>
            </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="DateLbl" runat="server" Text="Date:" Visible="false"   ></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtDate" runat="server" TextMode="Date" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="TimeLbl" runat="server" Text="Time:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtTime" runat="server" TextMode="Time" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LeaveAtLbl" runat="server" Text="Leave At:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtLeaveAt" runat="server"  Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="BringIndateLbl" runat="server" Text="Bring In Date:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtBringInDate" runat="server" TextMode="Date" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="CloseOutDateLbl" runat="server" Text="Close Out By Date:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtCloseOutDate" runat="server" TextMode="Date" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                 <asp:Label ID="NoteLbl" runat="server" Text="Notes:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                  <asp:TextBox ID="TxtNotes" runat="server" TextMode="MultiLine" Rows="5" ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>      
    </asp:Table>
    <br />
             <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:GridView ID="GridItem" 
                    runat="server" 
                   ></asp:GridView>
            </asp:TableCell>
        </asp:TableRow>
    <br />
        <asp:Table ID="Table2" runat="server" BorderWidth="2">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                <asp:Label ID="LblAddItem" runat="server" Text="Add New Item To Inventory" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblItem" 
                    runat="server" 
                    Text="Item: " 
                    ></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtItem" 
                    runat="server" 
                    ></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblItemNotes" 
                    runat="server" 
                    Text="Item Notes: "
                    ></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtItemNotes" 
                    runat="server" 
                     TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblQuantity"
                    runat="server" 
                    Text="Quantity " 
                    ></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtQuantity" 
                    runat="server" 
                     TextMode="Number"
                     Text="1"></asp:TextBox>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnComplete" 
                    runat="server" 
                    Text="Add Item" 
                     OnClick="BtnComplete_Click"                    
                     />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblStatus" 
                    runat="server" 
                    ForeColor="Green"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     <br />
     <asp:Table ID="Table3" runat="server">
         <asp:TableRow>
              <asp:TableCell>
                <asp:Button
                    ID="BtnClear"
                    runat="server"
                    Text="Clear"
                    OnClick="BtnClear_Click" />
            </asp:TableCell>
             <asp:TableCell>

             </asp:TableCell>
            <asp:TableCell>
                <asp:Button
                    ID="BtnSave"
                    runat="server"
                    Text="Save"
                    OnClick="BtnSave_Click"
                    ValidationGroup="SaveGroup" />
            </asp:TableCell>
              <asp:TableCell>
                <asp:Label
                    ID="LblSaveStatus"
                    runat="server"
                    Text=""></asp:Label>
            </asp:TableCell>
         </asp:TableRow>
         </asp:Table>


      <asp:SqlDataSource ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select customer.CustomerID, FirstName + ' ' + LastName as CustomerName from Customer join serviceTicket on customer.customerID = serviceTicket.customerid where ServiceType = 'Auction' Order By LastName ASC"></asp:SqlDataSource>

</asp:Content>
