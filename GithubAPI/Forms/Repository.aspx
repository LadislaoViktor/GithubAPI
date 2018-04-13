<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repository.aspx.cs" Inherits="GithubAPI.Forms.Repository" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Repository</title>
  <link rel="stylesheet" href="/public/css/style.css" />
  <link rel="stylesheet" href="/public/font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="scmMaster" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
      <asp:UpdatePanel runat="server" ID="upGridEmpresas">
        <ContentTemplate>
          <asp:Panel ID="SearchRepository" runat="server">
            <div class="col-lg-12">
              <h1 class="page-header" style="margin-top: 300px; display: none">Repository Search</h1>
              <div class="page-dashboard__filter" style="margin-top: 35px;">
                <div class="row">
                  <div class="col-lg-4">
                    <div class="form-group">
                      <label for="">Buscar repositórios:</label>
                      <asp:TextBox ID="txtRepository" runat="server" MaxLength="300" CssClass="form-control border1"></asp:TextBox>
                    </div>
                  </div>
                  <div class="col-lg-6 page-dashboard__submit" style="padding: 10px;">

                    <!--Pesquisar-->
                    <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisa WebService" CssClass="btn btn-lg btn-success btn-radius" OnClick="btnPesquisar_Click" />

                    <!--Novo-->
                    <asp:Button ID="btnPesquisarGrid" runat="server" Text="Pesquisa Local" CssClass="btn btn-lg btn-success btn-radius" OnClick="btnPesquisarGrid_Click" />

                    <%--<!--Página-->
                    <asp:DropDownList ID="cmdItensPorPagina" runat="server" AutoPostBack="True" CssClass="btn btn-lg btn-success btn-radius" Style="float: right">
                      <asp:ListItem Selected="True" Value="10">10</asp:ListItem>
                      <asp:ListItem Value="50">50</asp:ListItem>
                      <asp:ListItem Value="100">100</asp:ListItem>
                    </asp:DropDownList>
                    <label id="lblRegistrosPorPagina">Registros por página</label>--%>
                  </div>
                </div>
              </div>
              <br />
              <div style="margin-top: -26px;">
                <div class="page-dashboard__table">
                  <br />
                  <div>
                    <asp:HiddenField ID="hddmyId" runat="server" />
                    <asp:HiddenField ID="hddOrdenacao" runat="server" />
                    <asp:HiddenField ID="hddPaginacao" runat="server" />
                    <%--<asp:HiddenField ID="hddIDCliente" runat="server" />--%>
                    <asp:GridView ID="dgvRepositories" runat="server" AutoGenerateColumns="False" DataKeyNames="myId" CssClass="table table-striped history_"
                      AllowPaging="True" AllowSorting="True" FooterStyle-BorderStyle="NotSet" OnSelectedIndexChanging="dgvRepositories_SelectedIndexChanging">
                      <Columns>
                        <asp:BoundField HeaderText="Codigo" DataField="myId" SortExpression="cdEmpresa" />
                        <asp:BoundField HeaderText="Nome" DataField="name" SortExpression="dsRazaoSocial" />
                        <asp:BoundField HeaderText="Descrição" DataField="description" SortExpression="dsStatus" />
                        <asp:CommandField ShowSelectButton="true" HeaderText="Visualizar" SelectText=""
                          ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" ControlStyle-ForeColor="Black" Visible="true">
                          <ControlStyle ForeColor="Black" CssClass="glyphicon glyphicon-edit" Width="15%" />
                          <HeaderStyle Width="10%" />
                          <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                      </Columns>
                      <PagerSettings Position="Bottom" Mode="Numeric" />
                      <FooterStyle CssClass="FooterStyle" />
                      <PagerStyle CssClass="FooterStyle" />
                      <EmptyDataTemplate>
                        There aren't any results.
                      </EmptyDataTemplate>
                    </asp:GridView>
                  </div>
                </div>
              </div>
            </div>
          </asp:Panel>
          <asp:Panel ID="pnlFormEmpresa" runat="server" Visible="false">
            <div class="col-lg-12">
              <h1 class="page-header" style="margin-top: 30px;">Repository Details</h1>
              <div class="page-dashboard__form">
                <div class="row" style="height:100%;">
                  <div class="col-lg-6">
                    <div class="col-lg-3" >
                      <label>Status </label>
                    </div>
                    <div class="col-lg-3">
                      <asp:CheckBox ID="ckbAtivo" AutoPostBack="false" runat="server" />
                    </div>
                     <div class="col-lg-3">
                      <asp:Label ID="Label2" runat="server"> Language:</asp:Label>
                    </div>

                    <div class="col-lg-3">
                      <asp:TextBox ID="txtLanguage" AutoPostBack="true" MaxLength="16" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-3">
                      <asp:HiddenField ID="hddAltercdEmpresa" runat="server" />
                      <%--<asp:HiddenField ID="hdd" runat="server" />--%>
                      <label style="text-align: right;">Name:</label>
                    </div>
                    
                    <div class="col-lg-3">
                      <asp:TextBox ID="txtName" AutoPostBack="false" CssClass="form-control" runat="server" TabIndex="0"></asp:TextBox>
                    </div>
                    <br />
                    <div class="col-lg-3">
                      <lable> Full Name:</lable>
                    </div>
                    
                    <div class="col-lg-3">
                      <asp:TextBox ID="txtFullName" AutoPostBack="false" CssClass="form-control" runat="server" TabIndex="2"></asp:TextBox>
                    </div>
                    <br />
                    <div class="col-lg-3">
                      <asp:Label ID="lblCnpj" runat="server"> Description:</asp:Label>
                    </div>

                    <div class="col-lg-3">
                      <asp:TextBox ID="txtDescription" AutoPostBack="true" MaxLength="16" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-lg-3">
                      <asp:Label ID="Label1" runat="server"> Created at:</asp:Label>
                    </div>

                    <div class="col-lg-3">
                      <asp:TextBox ID="txtCreatedAt" AutoPostBack="true" MaxLength="16" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                  </div>

                  <div class="col-lg-10" style="padding-left: 250px;">
                    <div class="col-lg-12 page-dashboard__submit">
                      <asp:Button ID="btnVoltarVisualizar" runat="server" CssClass="btn btn-lg btn-success" Text="Voltar" Visible="false" />
                      <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-lg btn-success" Visible="false" />
                      <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="btn btn-lg btn-success" OnClick="btnVoltar_Click" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </asp:Panel>
          <asp:Panel runat="server" ID="pnlModalInformacao" Visible="false" CssClass="modal1">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="page-header">Atenção</h4>
              </div>
              <div class="modal-body">
                <asp:Label ID="lblInformacao" runat="server"></asp:Label>
              </div>
              <div class="modal-footer">
                <%--<asp:Button ID="btnNao" runat="server" Text="Não" CssClass="btn btn-lg btn-success" OnClick="" />
                            <asp:Button ID="btnSim" runat="server" Text="Sim" CssClass="btn btn-lg btn-success" OnClick="" />--%>
                <asp:Button ID="btnFecharModalInformacao" Text="Ok" runat="server" />
              </div>
            </div>
          </asp:Panel>
          <asp:Panel runat="server" ID="pnlConfirmaExclusao" Visible="false" CssClass="modal1">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="page-header">Atenção</h4>
              </div>
              <div class="modal-body">
                <asp:Label ID="lblConfirmaExclusao" runat="server"></asp:Label>
              </div>
              <div class="modal-footer">
                <asp:Button ID="btnNao" runat="server" Text="Não" CssClass="btn btn-lg btn-success" />
                <asp:Button ID="btnSim" runat="server" Text="Sim" CssClass="btn btn-lg btn-success" />
              </div>
            </div>
          </asp:Panel>
        </ContentTemplate>
      </asp:UpdatePanel>
    </div>
  </form>
</body>
</html>
