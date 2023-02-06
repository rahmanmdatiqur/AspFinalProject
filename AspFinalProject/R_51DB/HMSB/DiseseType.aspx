<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiseseType.aspx.cs" Inherits="HMSB.DiseseType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class=" col-md-12">
            <h2>Disese type</h2>
            <div class="d-flex justify-content-lg-end mb-1">
                <a runat="server" class="btn btn-primary" href="~/DiseseAdd.aspx"> <i class="fa fa-plus"></i>Add New</a>

            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-sm" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="dsDtype" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="d_Name" HeaderText="d_Name" SortExpression="d_Name" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsDtype" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBCon %>" DeleteCommand="DELETE FROM [Disese] WHERE [id] = @id" InsertCommand="INSERT INTO [Disese] ([d_Name]) VALUES (@d_Name)" SelectCommand="SELECT * FROM [Disese]" UpdateCommand="UPDATE [Disese] SET [d_Name] = @d_Name WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="d_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="d_Name" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
