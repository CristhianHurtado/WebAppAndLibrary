<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="WebAppCristhianHurtado_FinalRAD.Inventory" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Manage and insert new items</h1>
        <h1>
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </h1>
        <div class="row">
            <div class="col-md-4">
                <h2>Products:</h2>
                <p style="font-weight: 700">New Record:</p>
                <p style="font-weight: 700">
                    Name:
                    <asp:TextBox ID="txtProdName" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <p style="font-weight: 700">
                    Description:
                    <asp:TextBox ID="txtProdDesx" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                </p>
                <p style="font-weight: 700">
                    Brand:
                    <asp:TextBox ID="txtProdBrand" runat="server"></asp:TextBox>
                </p>
                <p style="font-weight: 700">
                    <asp:Button ID="btnInsertProd" runat="server" Text="Insert" OnClick="btnInsert_Click" />
                </p>
            </div>

            <p>
                Select a row to delete.</p>
            <p>
                &nbsp;</p>
            <p style="font-weight: 700">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" OnRowDeleting="proDelete">
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hiddencol" DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-CssClass="hiddencol">
                        </asp:BoundField>
                        <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
                        <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                        <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </p>
            <p style="font-weight: 700">
                &nbsp;</p>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalLibrary_CristhianHurtado.EmmasDataSetTableAdapters.InvTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="invQuantity" Type="Int32" />
                    <asp:Parameter Name="invSize" Type="Decimal" />
                    <asp:Parameter Name="invMeasure" Type="String" />
                    <asp:Parameter Name="invPrice" Type="Decimal" />
                    <asp:Parameter Name="productID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="invQuantity" Type="Int32" />
                    <asp:Parameter Name="invSize" Type="Decimal" />
                    <asp:Parameter Name="invMeasure" Type="String" />
                    <asp:Parameter Name="invPrice" Type="Decimal" />
                    <asp:Parameter Name="productID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalLibrary_CristhianHurtado.EmmasDataSetTableAdapters.productTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtProdName" PropertyName="Text" Name="prodName" Type="String" />
                    <asp:ControlParameter ControlID="txtProdDesx" PropertyName="Text" Name="prodDescription" Type="String" />
                    <asp:ControlParameter ControlID="txtProdBrand" PropertyName="Text" Name="prodBrand" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="prodName" Type="String" />
                    <asp:Parameter Name="prodDescription" Type="String" />
                    <asp:Parameter Name="prodBrand" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <hr />
            <div class="col-md-4">
                <h2>Inventory:</h2>
                <p>New record:</p>
                <p>
                    &nbsp;
                </p>
                <p>
                    Product:
                    <asp:DropDownList ID="dplInvProductId" runat="server" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id">
                    </asp:DropDownList>
                </p>
                <p>
                    Quantity:
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        ControlToValidate="txtQuantity" runat="server"
                        ErrorMessage="Only Numbers allowed"
                        ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
                </p>
                <p>
                    Size:
                    <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        ControlToValidate="txtSize" runat="server"
                        ErrorMessage="Only Numbers allowed"
                        ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
                </p>
                <p>
                    Measure:
                    <asp:TextBox ID="txtMeasure" runat="server"></asp:TextBox>
                </p>
                <p>
                    Price:
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                        ControlToValidate="txtPrice" runat="server"
                        ErrorMessage="Only Numbers allowed"
                        ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
                </p>
                <p>
                    <asp:Button ID="btnInvInsert" runat="server" OnClick="btnInvInsert_Click" Text="Insert" />
                </p>

            </div>


            <p>
                Select a row to delete.</p>
            <p>
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource2" OnRowDeleting="GridView4_RowDeleting" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="Product" SortExpression="productID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                        <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
                        <asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
                        <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
        </div>
    </div>
    <p style="font-weight: 700">
        &nbsp;
    </p>
    <p style="font-weight: 700">
        &nbsp;
    </p>

</asp:Content>

