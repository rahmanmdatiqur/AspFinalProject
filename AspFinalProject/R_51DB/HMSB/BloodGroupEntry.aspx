<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BloodGroupEntry.aspx.cs" Inherits="HMSB.BloodGroupEntry" %>

<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="uc1" TagName="WebUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h2>BloodGroupEntry</h2>
            <uc1:WebUserControl1 runat="server" id="WebUserControl1" />
            
            <asp:ObjectDataSource ID="objBloodGroup" runat="server" DataObjectTypeName="HMSB.Models.BloodGroup" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Get" TypeName="HMSB.DAL.BloodGroupGetWay" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
