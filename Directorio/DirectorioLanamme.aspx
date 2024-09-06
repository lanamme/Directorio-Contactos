<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DirectorioLanamme.aspx.cs" Inherits="Directorio.DirectorioLanamme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
    <div class="row">
        <!-- Lista de Departamentos en el lado izquierdo -->
        <div class="col-md-2">
             <div class="department-list">

                 <!-- Campo de búsqueda -->
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar..." />              
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                <br /><br />
                <asp:LinkButton ID="UnidadTodos" runat="server" Text="Mostrar Todos" CommandArgument="Todos" OnClick="FiltroUnidad" CssClass="department-link" />

            </div>

             <div class="menu-section">
                <h3 class="menu-title" onclick="toggleMenu('section1')">Área Administrativa</h3>
                <div id="section1" class="menu-content">
                    <asp:LinkButton ID="Unidad1" runat="server" Text="Unidad Administrativa" CommandArgument="Unidad Administrativa" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad2" runat="server" Text="Unidad Centro de Transferencia Tecnológica" CommandArgument="Unidad Centro de Transferencia Tecnológica" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad3" runat="server" Text="Unidad de Gestión de Calidad" CommandArgument="Unidad de Gestión de Calidad" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad4" runat="server" Text="Unidad Proveeduría y Bienes Institucionales" CommandArgument="Unidad Proveeduría y Bienes Institucionales" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad5" runat="server" Text="Unidad Tecnologías de Información" CommandArgument="Unidad Tecnologías de Información" OnClick="FiltroUnidad" CssClass="menu-link" />
                </div>
            </div>

            <div class="menu-section">
                <h3 class="menu-title" onclick="toggleMenu('section2')">Dirección</h3>
                <div id="section2" class="menu-content">
                    <asp:LinkButton ID="Unidad6" runat="server" Text="Unidad Auditoria Técnica" CommandArgument="Unidad Auditoria Técnica" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad7" runat="server" Text="Programas LanammeUCR" CommandArgument="Programas LanammeUCR" OnClick="FiltroUnidad" CssClass="menu-link" />
                </div>
            </div>

            <div class="menu-section">
                <h3 class="menu-title" onclick="toggleMenu('section3')">PITRA</h3>
                <div id="section3" class="menu-content">
                    <asp:LinkButton ID="Unidad8" runat="server" Text="Programa de Infraestructura del Transporte" CommandArgument="Programa de Infraestructura del Transporte" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad9" runat="server" Text="Unidad de Investigación en Infraestructura y Transporte" CommandArgument="Unidad de Investigación en Infraestructura y Transporte" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad10" runat="server" Text="Unidad Gestión y Evaluación de la Red Vial Nacional" CommandArgument="Unidad Gestión y Evaluación de la Red Vial Nacional" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad11" runat="server" Text="Unidad Gestión Municipal" CommandArgument="Unidad Gestión Municipal" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad12" runat="server" Text="Unidad de Normativa y Actualización Técnica" CommandArgument="Unidad de Normativa y Actualización Técnica" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad13" runat="server" Text="Unidad de Seguridad Vial" CommandArgument="Unidad de Seguridad Vial" OnClick="FiltroUnidad" CssClass="menu-link" />
                </div>
            </div>

            <div class="menu-section">
                <h3 class="menu-title" onclick="toggleMenu('section4')">PIE</h3>
                <div id="section4" class="menu-content">
                    <asp:LinkButton ID="Unidad14" runat="server" Text="Unidad de Puentes" CommandArgument="Unidad de Puentes" OnClick="FiltroUnidad" CssClass="menu-link" />
                </div>
            </div>

            <div class="menu-section">
                <h3 class="menu-title" onclick="toggleMenu('section5')">Laboratorios</h3>
                <div id="section5" class="menu-content">
                    <asp:LinkButton ID="Unidad15" runat="server" Text="Área de Construcción" CommandArgument="Área de Construcción" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad16" runat="server" Text="Laboratorios de Infraestructura Civil" CommandArgument="Laboratorios de Infraestructura Civil" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad17" runat="server" Text="Laboratorios de Infraestructura Vial" CommandArgument="Laboratorios de Infraestructura Vial" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad18" runat="server" Text="Área de Transportes y Pavimentos" CommandArgument="Área de Transportes y Pavimentos" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad19" runat="server" Text="Área de Meteorología" CommandArgument="Área de Meteorología" OnClick="FiltroUnidad" CssClass="menu-link" />
                    <asp:LinkButton ID="Unidad20" runat="server" Text="Laboratorio de Fuerza" CommandArgument="Laboratorio de Fuerza" OnClick="FiltroUnidad" CssClass="menu-link" />
                </div>
            </div>


        </div>

        <!-- Lista de Empleados en el lado derecho -->
        <div class="col-md-10">
            <div class="employee-list d-flex flex-wrap justify-content-start">
                <asp:Repeater ID="rpFuncionarios" runat="server">
                <ItemTemplate>
                    <div class="employee-card">
                        <div class="employee-header">
                            <h3><%# Eval("nombre_completo") %></h3>
                        </div>
                        <div class="employee-body">
                            <img src='<%# Eval("rutaFotoMostrar") %>' alt='<%# Eval("nombre_completo") %>' class="img-thumbnail employee-photo">
                            <p><strong><%# Eval("Unidad.nombre") %></strong>
                            </br><%# Eval("puesto") %>
                            </br> <strong>Edificio:</strong> <%# Eval("extension") %>
                            </br> <strong>Oficina:</strong> <%# Eval("extension") %>
                            </br> <strong>Teléfono:</strong> <%# Eval("extension") %>
                            </br><strong>Correo:</strong>
                            </br> <a href='mailto:<%# Eval("correo") %>'><%# Eval("correo") %></a></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

                <!-- Etiqueta para mostrar el mensaje "No se encontraron resultados" -->
                <asp:Label ID="lblNoResults" runat="server" Text="No se encontraron resultados" CssClass="alert alert-warning" Visible="false"></asp:Label>

            </div>
        </div>
    </div>
</div>



<script>
    function toggleMenu(sectionId) {
        var content = document.getElementById(sectionId);
        if (content.style.display === "none" || content.style.display === "") {
            content.style.display = "block"; // Mostrar sección
        } else {
            content.style.display = "none";  // Ocultar sección
        }
    }
</script>
</asp:Content>
