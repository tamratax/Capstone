<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ViewNote.aspx.cs" Inherits="Lab2.ViewTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>View Note</h1>


    <asp:Table ID="OuterTable" runat="server">
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table ID="LeftTable1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>


                            <fieldset>
                                <legend>Select Note</legend>
                                <asp:Table
                                    ID="TblTicketSelection"
                                    runat="server">
                                    <asp:TableRow>
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
                                    </asp:TableRow>
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
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Label
                                                ID="LblNoteSelect"
                                                runat="server"
                                                Text="Select Note To View/Edit:"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:ListBox
                                                ID="LstBoxNoteSelect"
                                                runat="server"
                                                OnSelectedIndexChanged="LstBoxNoteSelect_SelectedIndexChanged"
                                                AutoPostBack="true"
                                                OnDataBound="LstBoxNoteSelect_DataBound"></asp:ListBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button
                                                ID="BtnClear"
                                                runat="server"
                                                Text="Clear"
                                                OnClick="BtnClear_Click" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Button 
                                                ID="BtnAddNote"
                                                runat="server"
                                                Text="Add New Note ->"
                                                OnClick="BtnAddNote_Click"/>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </fieldset>

                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell>
                <fieldset>
                    <legend>Note Details</legend>

                    <asp:Table ID="RightTable2" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblTicketChange"
                                    runat="server"
                                    Text="Note Last Updated:"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label
                                    ID="LblChangeDate"
                                    runat="server"
                                    Text=""></asp:Label>
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
                                <asp:Label
                                    ID="LblNoteCreator"
                                    runat="server"
                                    Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="LblTitle" runat="server" Text="Note Title: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="LblDetails" runat="server" Text="Note Details: "></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TxtDetails" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label
                                    ID="LblSaveStatus"
                                    runat="server"
                                    Text=""></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Button
                                    ID="BtnSaveNote"
                                    runat="server"
                                    Text="Save Note Changes"
                                    OnClick="BtnSaveNote_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>


    <asp:SqlDataSource
        ID="dtasrcCustomerList"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="Select CustomerID, FirstName + ' ' + LastName as CustomerName
                    from Customer Order By LastName ASC"></asp:SqlDataSource>



</asp:Content>
