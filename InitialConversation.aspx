<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialConversation.aspx.cs" Inherits="WalkerS_Lab1Part3.AddCustomer" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
<%--    <h1 class="display-4">Initial Conversation</h1>--%>
        <h1 class="display-6">Initial Conversation</h1>
 
                <asp:Label
                    ID="LblFirstName"
                    runat="server"
                    Text="First Name:">
                </asp:Label>
         
                <asp:TextBox
                    ID="TxtFirstName"
                    runat="server"
                    Text="">
                </asp:TextBox>
        
                <asp:RequiredFieldValidator
                    ID="RfvFirstName"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtFirstName"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
 

                <asp:Label
                    ID="LblLastName"
                    runat="server"
                    Text="Last Name:"></asp:Label>
     
                <asp:TextBox
                    ID="TxtLastName"
                    runat="server"
                    Text="">
                </asp:TextBox>
       
                <asp:RequiredFieldValidator
                    ID="RfvLastName"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtLastName"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
    
                <asp:Label
                    ID="LblPhoneNumber"
                    runat="server"
                    Text="Home Phone: "></asp:Label>
       
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

                <asp:Label
                    ID="LblEmail"
                    runat="server"
                    Text="Email:"></asp:Label>
  
                <asp:TextBox
                    ID="TxtEmail"
                    runat="server"
                    Text=""
                    TextMode="Email">
                </asp:TextBox>
   
                <asp:RequiredFieldValidator
                    ID="RfvEmail"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="TxtEmail"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
    
                <asp:Label ID="LblPCA" runat="server" Text="Primary Contact Address" Font-Bold="true"></asp:Label>
  
                <asp:Label ID="LblStreet" runat="server" Text="Street Address: "></asp:Label>
     
                <asp:TextBox ID="TxtStreet" runat="server"></asp:TextBox>
   
                <asp:Label ID="LblCity" runat="server" Text="City: "></asp:Label>
   
                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>

                <asp:Label ID="LblState" runat="server" Text="State: "></asp:Label>
      
                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
  
                <asp:Label ID="LblZip" runat="server" Text="Zip Code: "></asp:Label>
     
                <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox>
  
                <asp:Label
                    ID="LblCompletedByEmp"
                    runat="server"
                    Text="Completed By:"></asp:Label>

                <asp:DropDownList
                    ID="DdlCompletedByEmp"
                    runat="server"
                    DataSourceID="dtasrcEmpList"
                    DataTextField="EmpName"
                    DataValueField="EmployeeID"
                    OnDataBound="DdlCompletedByEmp_DataBound"></asp:DropDownList>
     
                <asp:RequiredFieldValidator
                    ID="RfvCompletedByEmp"
                    runat="server"
                    ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="DdlCompletedByEmp"
                    Text="This Field Is Required"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    ValidationGroup="SaveGroup"
                    Display="Dynamic"
                    InitialValue="-1"></asp:RequiredFieldValidator>
    
                <asp:Label
                    ID="LblCompleted"
                    runat="server"
                    Text="Check If Complete:"></asp:Label>
   
                <asp:CheckBox
                    ID="ChkBoxCompleted"
                    runat="server" />
  
                <asp:Button ID="BtnViewCustomerPage"
                    runat="server"
                    Text="View Customers ->"
                    OnClick="BtnViewCustomerPage_Click" />
    
                <asp:Button ID="BtnPopulate"
                    runat="server"
                    Text="Populate"
                    OnClick="BtnPopulate_Click" />

                <asp:Button
                    ID="BtnClear"
                    runat="server"
                    Text="Clear"
                    OnClick="BtnClear_Click" />
       
                <asp:Button
                    ID="BtnSave"
                    runat="server"
                    Text="Save"
                    OnClick="BtnSave_Click"
                    ValidationGroup="SaveGroup" />
    
                <asp:Label
                    ID="LblSaveStatus"
                    runat="server"
                    Text=""></asp:Label>
      
                <asp:Button
                    ID="BtnProceed"
                    runat="server"
                    Text="Proceed to Service Order Form" 
                    OnClick="BtnProceed_Click" />
   

    <asp:SqlDataSource ID="dtasrcEmpList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName 'EmpName' from EMPLOYEE Order By EmpLastName Desc"></asp:SqlDataSource>

    

</asp:Content>

