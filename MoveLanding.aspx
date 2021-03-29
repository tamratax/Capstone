<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="MoveLanding.aspx.cs" Inherits="Lab3.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="margin-left:auto; margin-right:auto; text-align:center">
        <asp:Label ID="LblService" runat="server" Text="Select Move Service Ticket: "></asp:Label>
    <asp:DropDownList
                    ID="DDLType"
                    runat="server"
                    OnDataBound="DDLType_DataBound"
                    AutoPostBack="true" 
                    OnSelectedIndexChanged="DDLType_SelectedIndexChanged">
                </asp:DropDownList>
    <br />
        <br />
        </div>
    <div id="divlanding" runat="server">
        <div style="margin-left:auto; margin-right:auto; text-align:center">
        
        <asp:Button ID="Btnpremove" runat="server" Text="Pre-Move Assessment" BackColor="DarkGreen" ForeColor="White" OnClick="Btnpremove_Click"/>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnMove" runat="server" Text="Move Assessment" BackColor="DarkGreen" ForeColor="White" OnClick="BtnMove_Click"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnMoveService" runat="server" Text="Move Service Order" BackColor="DarkGreen" ForeColor="White" OnClick="BtnMoveService_Click"/>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnComplete" runat="server" Text="Completion Form" BackColor="DarkGreen" ForeColor="White" OnClick="BtnComplete_Click"/>
        <br />
        <br />
    </div>


        <script>
        function SetStatus(value) {
            var progressbar = document.getElementById('divStatus');
            progressbar.style.width = value + "%";
        }
        </script>

        
       <div style="margin-left:auto; margin-right:auto; text-align:center">
       <asp:Label ID="StatBar" runat="server" Text="Service Status Bar" Font-Bold="true" Font-Size="Larger"></asp:Label>
       
       <asp:Label ID="StatusPercent" runat="server" Text="" Font-Bold="true"></asp:Label>
    </div>
        <div class="progress" style="width:40%; margin-left:auto; margin-right:auto">
        <div id="progressbar" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="70"
        aria-valuemin="0" aria-valuemax="100" style="width:0%" runat="server">
  </div>
</div>

        <div style="margin-left:auto; margin-right:auto; text-align:center">


            </div>
    </div>

</asp:Content>
