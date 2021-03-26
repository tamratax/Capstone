 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitialConversation.aspx.cs" Inherits="WalkerS_Lab1Part3.AddCustomer" MasterPageFile="LabFormat.Master" %>

<%-- Coded By: RoCo Consulting --%>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <%--    <h1 class="display-4">Initial Conversation</h1>--%>
    <h1 class="display-6">Initial Conversation</h1>
    <div class="form-group">
        <label>Created By: </label>
        <asp:DropDownList
            ID="DdlCompletedByEmp"
            runat="server"
            DataSourceID="dtasrcEmpList"
            DataTextField="EmpName"
            DataValueField="EmployeeID"
            OnDataBound="DdlCompletedByEmp_DataBound" Width="100%">
        </asp:DropDownList>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label>First Name</label>
            <%--      <input type="email" class="form-control" id="TxtFirstName" placeholder="First Name" />--%>
            <asp:TextBox
                ID="TxtFirstName"
                runat="server"
                Placeholder="First Name"
                class="form-control">
            </asp:TextBox>
        </div>
        <div class="form-group col-md-6">
            <label>Last Name</label>
            <%--      <input type="password" class="form-control" id="TxtLastName" placeholder="Password" />--%>
            <asp:TextBox
                ID="TxtLastName"
                runat="server"
                Placeholder="Last Name"
                class="form-control">
            </asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label>Email</label>
        <%--            <input type="email" class="form-control" id="inputEmail4" placeholder="Email">--%>
        <asp:TextBox
            ID="TxtEmail"
            runat="server"
            Placeholder="Email Address"
            class="form-control"></asp:TextBox>
    </div>
    <div class="form-row">
        <div class="form-group col-md-4">
            <label>Cell Phone</label>
            <asp:TextBox
                ID="TxtCellPhone"
                runat="server"
                Placeholder="Cell Phone"
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Work Phone</label>
            <asp:TextBox
                ID="TxtWorkPhone"
                runat="server"
                Placeholder="Work Phone"
                class="form-control"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <label>Home Phone</label>
            <asp:TextBox
                ID="TxtPhoneNumber"
                runat="server"
                Placeholder="Home Phone"
                class="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label>Address (Current Address)</label>
        <%--        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">--%>
        <asp:TextBox ID="TxtStreet"
            runat="server"
            Placeholder="1234 Main St"
            class="form-control"></asp:TextBox>
    </div>
    <%--    <div class="form-group">
        <label for="inputAddress2">Address 2 (Optional)</label>
        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
    </div>--%>
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
    <div class="form-row float-right">
        <asp:Label
            ID="LblSaveStatus"
            runat="server"
            Text=""></asp:Label>
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

        <asp:Button
            ID="BtnProceed"
            runat="server"
            Text="Proceed to Service Order Form"
            OnClick="BtnProceed_Click" />
    </div>


    <%--                <asp:Label
                    ID="LblFirstName"
                    runat="server"
                    Text="First Name:">
                </asp:Label>--%>

    <%--                <asp:TextBox
                    ID="TxtFirstName"
                    runat="server"
                    Text="">
                </asp:TextBox>--%>

    <asp:RequiredFieldValidator
        ID="RfvFirstName"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="TxtFirstName"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>


    <%--                <asp:Label
                    ID="LblLastName"
                    runat="server"
                    Text="Last Name:"></asp:Label>
     
                <asp:TextBox
                    ID="TxtLastName"
                    runat="server"
                    Text="">
                </asp:TextBox>--%>

    <asp:RequiredFieldValidator
        ID="RfvLastName"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="TxtLastName"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>

    <%--  <asp:Label
        ID="LblPhoneNumber"
        runat="server"
        Text="Home Phone: "></asp:Label>

    <asp:TextBox
        ID="TxtPhoneNumber"
        runat="server"
        Text=""></asp:TextBox>--%>

    <%--<asp:Label
                    ID="LblCellPhone"
                    runat="server"
                    Text=" Cell Phone: "></asp:Label>--%>

    <%--    <asp:TextBox
        ID="TxtCellPhone"
        runat="server"
        Text=""></asp:TextBox>--%>

    <%--   <asp:Label
        ID="LblWorkPhone"
        runat="server"
        Text=" Work Phone: "></asp:Label>

    <asp:TextBox
        ID="TxtWorkPhone"
        runat="server"
        Text=""></asp:TextBox>--%>

    <%--        <asp:Label
            ID="LblEmail"
            runat="server"
            Text="Email:"></asp:Label>--%>

    <%--    <asp:TextBox
        ID="TxtEmail"
        runat="server"
        Text=""
        TextMode="Email">
    </asp:TextBox>--%>

    <asp:RequiredFieldValidator
        ID="RfvEmail"
        runat="server"
        ErrorMessage="RequiredFieldValidator"
        ControlToValidate="TxtEmail"
        Text="This Field Is Required"
        ForeColor="Red"
        SetFocusOnError="true"
        ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>

    <%--        <asp:Label ID="LblPCA" runat="server" Text="Primary Contact Address" Font-Bold="true"></asp:Label>--%>

    <%--    <asp:Label ID="LblStreet" runat="server" Text="Street Address: "></asp:Label>--%>

    <%--    <asp:TextBox ID="TxtStreet" runat="server"></asp:TextBox>--%>

    <%--        <asp:Label ID="LblCity" runat="server" Text="City: "></asp:Label>--%>

    <%--    <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>--%>

    <%--        <asp:Label ID="LblState" runat="server" Text="State: "></asp:Label>--%>

    <%--    <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>--%>

    <%--        <asp:Label ID="LblZip" runat="server" Text="Zip Code: "></asp:Label>--%>

    <%--    <asp:TextBox ID="TxtZip" runat="server"></asp:TextBox>--%>

    <%--        <asp:Label
            ID="LblCompletedByEmp"
            runat="server"
            Text="Completed By:"></asp:Label>--%>

    <%--<asp:DropDownList
            ID="DdlCompletedByEmp"
            runat="server"
            DataSourceID="dtasrcEmpList"
            DataTextField="EmpName"
            DataValueField="EmployeeID"
            OnDataBound="DdlCompletedByEmp_DataBound">
        </asp:DropDownList>--%>

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

    <%--        <asp:Label
            ID="LblCompleted"
            runat="server"
            Text="Check If Complete:"></asp:Label>--%>

    <%--        <asp:CheckBox
            ID="ChkBoxCompleted"
            runat="server" />--%>

    <%--        <asp:Button ID="BtnViewCustomerPage"
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
            ValidationGroup="SaveGroup" />--%>

    <%--    <asp:Label
        ID="LblSaveStatus"
        runat="server"
        Text=""></asp:Label>--%>

    <%--        <asp:Button
            ID="BtnProceed"
            runat="server"
            Text="Proceed to Service Order Form"
            OnClick="BtnProceed_Click" />--%>


    <asp:SqlDataSource ID="dtasrcEmpList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName 'EmpName' from EMPLOYEE Order By EmpLastName Desc"></asp:SqlDataSource>
</asp:Content>

