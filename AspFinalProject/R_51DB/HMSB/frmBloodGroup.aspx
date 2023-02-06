<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmBloodGroup.aspx.cs" Inherits="HMSB.frmBloodGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col">
            <h2>BloodGroup List</h2>
              <div class="d-flex justify-content-end">
                <a href="BloodGroupEntry.aspx" class="btn btn-outline-primary btn-sm">Add New</a>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AllowPaging="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="bg_id" DataSourceID="dsBG" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="bg_id" HeaderText="bg_id" InsertVisible="False" ReadOnly="True" SortExpression="bg_id" />
                    <asp:BoundField DataField="bloodgroup" HeaderText="bloodgroup" SortExpression="bloodgroup" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />

            </asp:GridView>
           
            <asp:SqlDataSource ID="dsBG" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnection %>" DeleteCommand="DELETE FROM [BloodGroup] WHERE [bg_id] = @bg_id" InsertCommand="INSERT INTO [BloodGroup] ([bloodgroup]) VALUES (@bloodgroup)" SelectCommand="SELECT * FROM [BloodGroup]" UpdateCommand="UPDATE [BloodGroup] SET [bloodgroup] = @bloodgroup WHERE [bg_id] = @bg_id">
                <DeleteParameters>
                    <asp:Parameter Name="bg_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="bloodgroup" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="bloodgroup" Type="String" />
                    <asp:Parameter Name="bg_id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
           
            
      </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
