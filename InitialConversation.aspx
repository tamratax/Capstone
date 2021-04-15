<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialConversation.aspx.cs" Inherits="WalkerS_Lab1Part3.AddCustomer" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <div class="text-center">
    <h1 class="display-4">Initial Conversation</h1>
        </div>
    <br />
    <div class="form-group float-right">
        <asp:Button ID="BtnPopulate"
            runat="server"
            Text="Populate"
            OnClick="BtnPopulate_Click" />
        </div>
        <br />
        <label>Created By: </label>
        <asp:DropDownList
            ID="DdlCompletedByEmp"
            runat="server"
            DataSourceID="dtasrcEmpList"
            DataTextField="EmpName"
            DataValueField="EmployeeID"
            OnDataBound="DdlCompletedByEmp_DataBound" Width="100%" CssClass="form-control">
        </asp:DropDownList>
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
    <br />
    <div class="form-row">
        <div class="form-group col-md-6">
            <label>First Name</label>
 
            <asp:TextBox
                ID="TxtFirstName"
                runat="server"
                Placeholder="First Name"
                class="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtFirstName" Text="Required" ForeColor="Red" ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group col-md-6">
            <label>Last Name</label>

            <asp:TextBox
                ID="TxtLastName"
                runat="server"
                Placeholder="Last Name"
                class="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtLastName" Text="Required" ForeColor="Red" ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <label>Email</label>

        <asp:TextBox
            ID="TxtEmail"
            runat="server"
            Placeholder="Email Address"
            class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtEmail" Text="Required" ForeColor="Red" ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
    </div>
    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Cell Phone</label>
            <asp:TextBox
                ID="TxtCellPhone"
                runat="server"
                Placeholder="Cell Phone"
                class="form-control"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must be a number" ControlToValidate="TxtCellPhone" ForeColor="Red" ValidationGroup="SaveGroup"></asp:CompareValidator>
        </div>
        <div class="form-group col-md-4">
            <label>Work Phone</label>
            <asp:TextBox
                ID="TxtWorkPhone"
                runat="server"
                Placeholder="Work Phone"
                class="form-control"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must be a number" ControlToValidate="TxtWorkPhone" ForeColor="Red" ValidationGroup="SaveGroup"></asp:CompareValidator>
        </div>
        <div class="form-group col-md-4">
            <label>Home Phone</label>
            <asp:TextBox
                ID="TxtPhoneNumber"
                runat="server"
                Placeholder="Home Phone"
                class="form-control"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck" Type="Integer" ErrorMessage="Must be a number" ControlToValidate="TxtPhoneNumber" ForeColor="Red" ValidationGroup="SaveGroup"></asp:CompareValidator>
        </div>
    </div>
    <div class="form-group">
        <label>Address (Current Address)</label>

        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder="1234 Main St"
            class="form-control"></asp:TextBox>
    </div>

    <div class="form-row">
         <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <asp:TextBox ID="TxtCity"
                runat="server"
                class="form-control"
                Placeholder="City"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label for="inputState">State</label>
            <asp:TextBox ID="TxtState"
                runat="server"
                class="form-control"
                Placeholder="State"></asp:TextBox>
        </div>
        <div class="form-group col-md-2">
            <label for="inputZip">Zip</label>
            <asp:TextBox ID="TxtZip"
                runat="server"
                class="form-control"
                Placeholder="Zip"></asp:TextBox>
        </div>

    </div>
        <div class="form-row">
       <div class="form-group col-md-4">
            <label for="LblInitialContactDate">Initial Contact</label>
            <%--            <input type="text" class="form-control" id="inputCity" />--%>
            <asp:TextBox ID="TxtInitialContactDate"
                runat="server"
                class="form-control"
                Placeholder=""
                TextMode="Date"></asp:TextBox>
        </div>
             <div class="form-group col-md-4">
            <label for="lblDeadlineDate">Deadline Date For Service</label>
            <asp:TextBox ID="TxtDeadlineDate"
                runat="server"
                class="form-control"
                Placeholder="Deadline Date"
                TextMode="Date"></asp:TextBox>
        </div>
             <div class="form-group col-md-4">
            <label for="LblReferralChannel">How Did You Hear About Us?</label>
            <asp:TextBox ID="TxtReferralChannel"
                runat="server"
                class="form-control"
                Placeholder="Ex. From A Friend"></asp:TextBox>
        </div>
       
    </div>     
          <div class="form-group">
            <label for="LblPreferredContactMethod">Preferred Contact Method</label>
              <asp:DropDownList 
                  ID="DdlPreferredContactMethod"
                  runat="server"
                  class="form-control"
                  width="100%"></asp:DropDownList> 
        </div>
       

    <div class="form-group">
        <label>Check if form is complete: </label>
        <asp:CheckBox
            ID="ChkBoxCompleted"
            runat="server" />
    </div>
    <br />
    <br />
    <div class="row justify-content-center">
        <asp:Label
            ID="LblSaveStatus"
            runat="server"
            Text=""></asp:Label>
        <asp:Button ID="BtnViewCustomerPage"
            runat="server"
            Text="View Customers ->"
            OnClick="BtnViewCustomerPage_Click" />

        

        <asp:Button
            ID="BtnClear"
            runat="server"
            Text="Clear"
            OnClick="BtnClear_Click" CssClass="btn-danger"/>

        <asp:Button
            ID="BtnSave"
            runat="server"
            Text="Save"
            OnClick="BtnSave_Click"
            ValidationGroup="SaveGroup" CssClass="btn-success" />
        </div>
        <%--<asp:Button
            ID="BtnProceed"
            runat="server"
            Text="Proceed to Service Order Form"
            OnClick="BtnProceed_Click" />
    </div>--%>




    <asp:SqlDataSource ID="dtasrcEmpList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName 'EmpName' from EMPLOYEE Order By EmpLastName Desc"></asp:SqlDataSource>
</asp:Content>

