<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiseseAdd.aspx.cs" Inherits="HMSB.DiseseAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
       <div class="col">
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
                   <h2>Add New DiseseType</h2>
                   <div runat="server" class="alert" id="alert" visible="false">
                       <button type="button" class="close" data-dismiss="alert" aria-label="closs">
                           <span>&times;</span>
                       </button>
                       <p runat="server" id="msg"></p>
                   </div>
                   <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table tabl" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="dsDadd" DefaultMode="Insert" AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                       <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                       <Fields>
                           <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                           <asp:BoundField DataField="d_Name" HeaderText="d_Name" SortExpression="d_Name" />
                           <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                       </Fields>
                       <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                       <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                       <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                       <RowStyle BackColor="White" ForeColor="#330099" />
                   </asp:DetailsView>
                   <asp:SqlDataSource ID="dsDadd" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnection %>" DeleteCommand="DELETE FROM [Disese] WHERE [id] = @id" InsertCommand="INSERT INTO [Disese] ([d_Name]) VALUES (@d_Name)" SelectCommand="SELECT * FROM [Disese]" UpdateCommand="UPDATE [Disese] SET [d_Name] = @d_Name WHERE [id] = @id">
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
               </ContentTemplate>
           </asp:UpdatePanel>
          
       </div>

   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
