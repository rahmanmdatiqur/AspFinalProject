<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPatientDetailes.aspx.cs" Inherits="HMSB.frmPatientDetailes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col">
            <h2>Patient List</h2>
             <div class="d-flex justify-content-end">
                <a href="frmPatientInfo.aspx" class="btn btn-outline-primary ">Add New</a>
                 </div>
                 <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="PtDtls" OnRowUpdating="GridView1_RowUpdating">
                     <Columns>
                         <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                         <asp:TemplateField HeaderText="pName" SortExpression="pName">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pName") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("pName") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="joinDate" SortExpression="joinDate">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" Text='<%# Bind("joinDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("joinDate") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="BloodGroup" SortExpression="bg_id">
                             <EditItemTemplate>
                            <%--     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("bg_id") %>'></asp:TextBox>--%>
                                 <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("bg_id") %>' DataSourceID="dsBldse" DataTextField="bloodgroup" DataValueField="bg_id"></asp:DropDownList>
                                 <asp:SqlDataSource ID="dsBldse" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" SelectCommand="SELECT * FROM [BloodGroup]"></asp:SqlDataSource>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("bloodgroup") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Disese" SortExpression="d_Id">
                             <EditItemTemplate>
                                <%-- <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("d_Id") %>'></asp:TextBox>--%>
                                 <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("d_Id") %>' DataSourceID="dsDrs" DataTextField="d_Name" DataValueField="id"></asp:DropDownList>
                                 <asp:SqlDataSource ID="dsDrs" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" SelectCommand="SELECT * FROM [Disese]"></asp:SqlDataSource>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("d_Name") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="picture" SortExpression="picture">
                             <EditItemTemplate>
                                <%-- <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>--%>
                                 <asp:FileUpload ID="fuPicture" runat="server" />
                                 <asp:HiddenField ID="HiddenField1" Value='<%# Bind("picture") %>' runat="server" />
                             </EditItemTemplate>
                             <ItemTemplate>
                                <%-- <asp:Label ID="Label5" runat="server" Text='<%# Bind("picture") %>'></asp:Label>--%>
                                  <asp:Image ID="Image1" runat="server" Width="50" ImageUrl='<%# Bind("picture","~/Images/{0}") %>'/>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="isActive" SortExpression="isActive">
                             <EditItemTemplate>
                                 <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isActive") %>' />
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isActive") %>' Enabled="false" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField ShowHeader="False">
                             <EditItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                 &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                 &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
                 <asp:SqlDataSource ID="PtDtls" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" DeleteCommand="DELETE FROM [Patient] WHERE [id] = @id" InsertCommand="INSERT INTO [Patient] ([pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (@pName, @joinDate, @bg_id, @d_Id, @picture, @isActive)" SelectCommand="select p.id, p.pName, p.joinDate, p.bg_id, b.bloodgroup, p.d_Id, d.d_Name, p.picture, p.isActive from Patient p Inner Join Disese d on d.id=p.d_Id Inner Join BloodGroup b on b.bg_id=p.bg_id" UpdateCommand="UPDATE [Patient] SET [pName] = @pName, [joinDate] = @joinDate, [bg_id] = @bg_id, [d_Id] = @d_Id, [picture] = @picture, [isActive] = @isActive WHERE [id] = @id">
                     <DeleteParameters>
                         <asp:Parameter Name="id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="pName" Type="String" />
                         <asp:Parameter DbType="Date" Name="joinDate" />
                         <asp:Parameter Name="bg_id" Type="Int32" />
                         <asp:Parameter Name="d_Id" Type="Int32" />
                         <asp:Parameter Name="picture" Type="String" />
                         <asp:Parameter Name="isActive" Type="Boolean" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="pName" Type="String" />
                         <asp:Parameter DbType="Date" Name="joinDate" />
                         <asp:Parameter Name="bg_id" Type="Int32" />
                         <asp:Parameter Name="d_Id" Type="Int32" />
                         <asp:Parameter Name="picture" Type="String" />
                         <asp:Parameter Name="isActive" Type="Boolean" />
                         <asp:Parameter Name="id" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
            
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
