<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="AddNote.aspx.cs" Inherits="Lab2.AddNote" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <h1>Add Note</h1>
    <asp:Table
        ID="Table1"
        runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <fieldset>
                    <legend>Select Service For New Note</legend>
                    <asp:Table
                        ID="TblTicketSelection"
                        runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label 
                                    ID="LblCustomer"
                                    runat="server" 
                                    Text="Customer:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label 
                                    ID="LblSelectedCustomer"
                                    runat="server" 
                                    Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                     <%--   <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblCustomerDropDown"
                                    runat="server"
                                    Text="Select Customer:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList
                                    ID="DdlCustomerList"
                                    runat="server"
                                    DataSourceID="dtasrcCustomerList"
                                    DataTextField="CustomerName"
                                    DataValueField="CustomerID"
                                    AutoPostBack="true"
                                    OnDataBound="DdlCustomerList_DataBound"
                                    OnSelectedIndexChanged="DdlCustomerList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RequiredFieldValidator
                                    ID="RfvCustomerList"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlCustomerList"
                                    Text="Please Choose A Valid Option"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>--%>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblServiceSelect"
                                    runat="server"
                                    Text="Select Service:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList
                                    ID="DdlServiceList"
                                    runat="server"
                                    OnSelectedIndexChanged="DdlServiceList_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    OnDataBound="DdlServiceList_DataBound">
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RequiredFieldValidator
                                    ID="RfvServiceList"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlServiceList"
                                    Text="Please Choose A Valid Option"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblCreatedBy"
                                    runat="server"
                                    Text="Created By:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList
                                    ID="DdlNoteCreator"
                                    runat="server"
                                    DataSourceID="dtasrcEmployeeContact"
                                    DataTextField="EmployeeName"
                                    DataValueField="EmployeeID"
                                    OnDataBound="DdlNoteCreator_DataBound">
                                </asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RequiredFieldValidator
                                    ID="RfvNoteCreator"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="DdlNoteCreator"
                                    Text="Please Choose A Valid Option"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"
                                    InitialValue="-1"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="LblTitle" runat="server" Text="Note Title: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RequiredFieldValidator
                                    ID="RfvTxtTitle"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="TxtTitle"
                                    Text="This Field Is Required"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="LblDetails" runat="server" Text="Note Details: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TxtDetails" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:RequiredFieldValidator
                                    ID="RfvTxtDetails"
                                    runat="server"
                                    ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="TxtDetails"
                                    Text="This Field Is Required"
                                    ForeColor="Red"
                                    SetFocusOnError="true"
                                    ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                        </asp:TableRow>                      
                    </asp:Table>
                    <asp:Table
                        ID="TblButtons"
                        runat="server">
                         <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Button
                                    ID="BtnAddNote"
                                    runat="server"
                                    Text="Save New Note"
                                    OnClick="BtnAddNote_Click"
                                    ValidationGroup="SaveGroup" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button
                                    ID="BtnClear"
                                    runat="server"
                                    Text="Clear"
                                    OnClick="BtnClear_Click" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button
                                    ID="BtnViewNote"
                                    runat="server"
                                    Text="View Notes ->"
                                    OnClick="BtnViewNote_Click" />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label
                                    ID="LblSaveStatus"
                                    runat="server"
                                    Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <%--<asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>--%>

    <asp:SqlDataSource
        ID="dtasrcEmployeeContact"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select EmployeeID, EmpFirstName + ' ' + EmpLastName as EmployeeName
                    from Employee Order By EmpLastName ASC"></asp:SqlDataSource>


</asp:Content>
