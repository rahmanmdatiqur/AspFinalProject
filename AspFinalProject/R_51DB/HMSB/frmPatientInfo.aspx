<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPatientInfo.aspx.cs" Inherits="HMSB.frmPatientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h2>Add New Patient</h2>
              <div class="d-flex justify-content-end">
                <a href="frmPatientDetailes.aspx"  class="btn btn-outline-primary ">View Detailes</a>
                 </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            <asp:DetailsView ID="DetailsView1" runat="server"  CssClass="table table-bordered" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="dsPnTl" DefaultMode="Insert" ForeColor="#333333" GridLines="None" OnItemInserting="DetailsView1_ItemInserting">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="Name" SortExpression="pName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"  ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("pName") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ValidationExpression="^[a-zA-Z]{3,8}$" ErrorMessage="Only Text format"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("pName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Admited" SortExpression="joinDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("joinDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="TextBox2" ErrorMessage="Admited is required"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" TextMode="Date" Text='<%# Bind("joinDate" ,"{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" MaximumValue="12-12-2022" MinimumValue="12-12-2015" ErrorMessage="Put between  date"></asp:RangeValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("joinDate") %>'></asp:Label> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BloodGroup"  SortExpression="bg_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("bg_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                   <%--         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("bg_id") %>'></asp:TextBox>--%>

                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" SelectedValue='<%# Bind("bg_id") %>' DataSourceID="bldgp" DataTextField="bloodgroup" DataValueField="bg_id"></asp:DropDownList>

                            <asp:SqlDataSource ID="bldgp" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" SelectCommand="SELECT * FROM [BloodGroup]"></asp:SqlDataSource>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("bg_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DiseseType" SortExpression="d_Id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("d_Id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                          <%--  <asp:TextBox ID="TextBox4" runat="server"  Text='<%# Bind("d_Id") %>'></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsss" DataTextField="d_Name" DataValueField="id" SelectedValue='<%# Bind("d_Id") %>'></asp:DropDownList>
                            <asp:SqlDataSource ID="dsss" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" SelectCommand="SELECT * FROM [Disese]"></asp:SqlDataSource>
                            <%--<asp:SqlDataSource ID="dstp" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" SelectCommand="SELECT * FROM [Disese]"></asp:SqlDataSource>--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("d_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="picture" SortExpression="picture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                           <%-- <asp:TextBox ID="TextBox5" runat="server"  Text='<%# Bind("picture") %>'></asp:TextBox>--%>
                            <asp:FileUpload ID="fuPicture" runat="server" />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>'/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="fuPicture" ErrorMessage="Picture is required"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                          
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="isActive" SortExpression="isActive">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isActive") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-control" Checked='<%# Bind("isActive") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isActive") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-success" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="dsPnTl" runat="server" ConnectionString="<%$ ConnectionStrings:HMSBConnectionString3 %>" DeleteCommand="DELETE FROM [Patient] WHERE [id] = @id" InsertCommand="INSERT INTO [Patient] ([pName], [joinDate], [bg_id], [d_Id], [picture], [isActive]) VALUES (@pName, @joinDate, @bg_id, @d_Id, @picture, @isActive)" SelectCommand="SELECT * FROM [Patient]" UpdateCommand="UPDATE [Patient] SET [pName] = @pName, [joinDate] = @joinDate, [bg_id] = @bg_id, [d_Id] = @d_Id, [picture] = @picture, [isActive] = @isActive WHERE [id] = @id">
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
