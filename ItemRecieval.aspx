<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="ItemRecieval.aspx.cs" Inherits="Lab3.ItemRecieval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:RadioButton ID="PickupBtn" runat="server" Text="Pick Up"  GroupName="RecievalOptions" OnCheckedChanged="PickupBtn_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
            <asp:TableCell>
               <asp:RadioButton ID="BringInBtn" runat="server" Text="Bring In" GroupName="RecievalOptions" OnCheckedChanged="BringInBtn_CheckedChanged" AutoPostBack="true" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblName" runat="server" Text="Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="LblPhone" runat="server" Text="Phone: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtPhone" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="AddressLbl" runat="server" Text="Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
                <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="ContactDateLbl" runat="server" Text="Contact Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtContactDate" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
           <asp:TableRow>
               <asp:TableCell>
                   <asp:Label ID="AddOnLbl" runat="server" Text="Add On:"></asp:Label>
               </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="YesBtn" runat="server" Text="Yes"  GroupName="AddOn" />
            </asp:TableCell>
            <asp:TableCell>
               <asp:RadioButton ID="NoBtn" runat="server" Text="No" GroupName="AddOn"  />
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
                    Text="ItemNotes: "
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




</asp:Content>
