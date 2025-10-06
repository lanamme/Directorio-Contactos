<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DirectorioLanamme.aspx.cs" Inherits="Directorio.DirectorioLanamme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <!-- Lista de Departamentos en el lado izquierdo -->
                    <div class="col-md-2">
                        <div class="department-list">

                            <!-- Campo de búsqueda -->
                            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar..." />
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                            <br />
                            <br />
                            <asp:LinkButton ID="UnidadTodos" runat="server" Text="Mostrar Todos" CommandArgument="Todos" OnClick="FiltroUnidad" CssClass="department-link" />

                        </div>

                        <div class="menu-section">
                            <asp:LinkButton class="menu-title" ID="lnkbtUnidad1" runat="server" Text="Dirección" CommandArgument="Dirección" OnClick="FiltroUnidad" />
                        </div>

                        <div class="menu-section">
                            <h3 class="menu-title" onclick="toggleMenu('section1')">Área Administrativa</h3>
                            <div id="section1" class="menu-content">
                                <asp:LinkButton ID="lnkbtUnidad2" runat="server" Text="Gestión Administrativa Financiera" CommandArgument="Unidad Administrativa" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad3" runat="server" Text="Centro de Transferencia Tecnológica" CommandArgument="Unidad de Centro de Transferencia Tecnológica" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad4" runat="server" Text="Servicios de Apoyo" CommandArgument="Servicios de Apoyo" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad5" runat="server" Text="Mantenimiento" CommandArgument="Unidad de Mantenimiento" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad6" runat="server" Text="Tecnologías de la Información" CommandArgument="Unidad Tecnologías de Información" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad7" runat="server" Text="Proveeduría y Bienes Institucionales" CommandArgument="Unidad de Proveeduría y Bienes Institucionales" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad8" runat="server" Text="Vínculo Externo" CommandArgument="Unidad de Vínculo Externo" OnClick="FiltroUnidad" CssClass="menu-link" />
                            </div>
                        </div>

                        <div class="menu-section">
                            <asp:LinkButton class="menu-title" ID="lnkbtUnidad9" runat="server" Text="Unidad de Gestión de la Calidad" CommandArgument="Unidad de Gestión de la Calidad" OnClick="FiltroUnidad" />
                        </div>

                        <div class="menu-section">
                            <asp:LinkButton class="menu-title" ID="lnkbtUnidad10" runat="server" Text="Servicios de Geomática" CommandArgument="Oficina de Servicios de Geomática" OnClick="FiltroUnidad" />
                        </div>

                        <div class="menu-section">
                            <asp:LinkButton class="menu-title" ID="lnkbtUnidad11" runat="server" Text="Unidad de Auditoria Técnica" CommandArgument="Unidad de Auditoria Técnica" OnClick="FiltroUnidad" />
                        </div>

                        <div class="menu-section">
                            <h3 class="menu-title" onclick="toggleMenu('sectionTransport')">Programa de Infraestructura del Transporte</h3>
                            <div id="sectionTransport" class="menu-content">
                                <!-- Sub-áreas del Programa de Infraestructura del Transporte con "Unidad" al inicio -->
                                <asp:LinkButton ID="lnkbtUnidad12" runat="server" Text="Gestión Municipal" CommandArgument="Unidad de Gestión Municipal" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad13" runat="server" Text="Gestión y Evaluación de la Red Vial Nacional" CommandArgument="Unidad de Gestión y Evaluación de la Red Vial Nacional" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad14" runat="server" Text="Investigación en Infraestructura y Transporte" CommandArgument="Unidad de Investigación en Infraestructura y Transporte" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad15" runat="server" Text="Normativa y Actualización Técnica" CommandArgument="Unidad de Normativa y Actualización Técnica" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad16" runat="server" Text="Seguridad Vial y Transporte" CommandArgument="Unidad de Seguridad Vial y Transporte" OnClick="FiltroUnidad" CssClass="menu-link" />
                            </div>
                        </div>

                        <div class="menu-section">
                            <h3 class="menu-title" onclick="toggleMenu('section4')">Programa de Ingeniería Estructrual</h3>
                            <div id="section4" class="menu-content">
                                <asp:LinkButton ID="lnkbtUnidad17" runat="server" Text="Puentes" CommandArgument="Unidad de Puentes" OnClick="FiltroUnidad" CssClass="menu-link" />
                            </div>
                        </div>

                        <div class="menu-section">
                            <asp:LinkButton class="menu-title" ID="lnkbtUnidad18" runat="server" Text="Programa de Ingeniería Geotécnica" CommandArgument="Programa de Ingeniería Geotécnica" OnClick="FiltroUnidad" />
                        </div>

                        <div class="menu-section">
                            <h3 class="menu-title" onclick="toggleMenu('section5')">Laboratorios</h3>
                            <div id="section5" class="menu-content">

                                <!-- Laboratorios -->
                                <asp:LinkButton ID="lnkbtUnidad19" runat="server" Text="Laboratorios" CommandArgument="Laboratorios" OnClick="FiltroUnidad" CssClass="menu-link" />

                                <!-- Área Metrología -->
                                <asp:LinkButton ID="lnkbtUnidad20" runat="server" Text="Área Metrología" CommandArgument="Área Metrología" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad21" runat="server" Text="Laboratorio de Fuerza" CommandArgument="Laboratorio de Fuerza" OnClick="FiltroUnidad" CssClass="menu-link" />

                                <!-- Área Construcción -->
                                <asp:LinkButton ID="lnkbtUnidad22" runat="server" Text="Área Construcción" CommandArgument="Área Construcción" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad23" runat="server" Text="Laboratorio de Concretos" CommandArgument="Laboratorio de Concretos" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad24" runat="server" Text="Laboratorio de Estructuras" CommandArgument="Laboratorio de Estructuras" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad25" runat="server" Text="Laboratorio de Geotecnia" CommandArgument="Laboratorio de Geotecnia" OnClick="FiltroUnidad" CssClass="menu-link" />

                                <!-- Área Transportes y Pavimentos -->
                                <asp:LinkButton ID="lnkbtUnidad26" runat="server" Text="Área Transportes y Pavimentos" CommandArgument="Área Transportes y Pavimentos" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad27" runat="server" Text="Laboratorio de Evaluación de Pavimentos" CommandArgument="Laboratorio de Evaluación de Pavimentos" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad28" runat="server" Text="Laboratorio de Materiales para Pavimentos" CommandArgument="Laboratorio de Materiales para Pavimentos" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad29" runat="server" Text="Laboratorio de Mezclas Asfálticas" CommandArgument="Laboratorio de Mezclas Asfálticas" OnClick="FiltroUnidad" CssClass="menu-link" />
                                <asp:LinkButton ID="lnkbtUnidad30" runat="server" Text="Laboratorio de Pavimentos a Escala Natural" CommandArgument="Laboratorio de Pavimentos a Escala Natural" OnClick="FiltroUnidad" CssClass="menu-link" />

                                <!-- Liberia -->
                                <asp:LinkButton ID="lnkbtUnidad31" runat="server" Text="Laboratorio Sede Liberia" CommandArgument="Laboratorio Sede Liberia" OnClick="FiltroUnidad" CssClass="menu-link" />

                            </div>
                        </div>


                    </div>

                    <!-- Lista de Empleados en formato tabla -->
                    <!-- Lista de Empleados en formato tabla -->
                    <div class="col-md-10">
                        <table id="tablaFuncionarios" class="employee-table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Puesto</th>
                                    <th>Teléfono</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpFuncionarios" runat="server">
                                    <ItemTemplate>
                                        <!-- Fila base (resumen) -->
                                        <tr>
                                            <td><strong><%# Eval("nombre_completo") %></strong></td>
                                            <td><%# Eval("puesto") + " - " + Eval("unidad.nombre") %></td>
                                            <td>
                                                <%# string.IsNullOrEmpty(Convert.ToString(Eval("extension"))) ? "" : "2511-" + Eval("extension") %>
                                            </td>
                                            <td class="text-right">
                                                <button type="button"
                                                    class="btn btn-outline-info btn-icon-circle"
                                                    onclick="return toggleDetalle('<%# Eval("id_funcionario") %>');">
                                                    <i class="fa-solid fa-circle-info" aria-hidden="true"></i>
                                                    <span>i</span>
                                                </button>
                                            </td>
                                        </tr>

                                        <!-- Fila colapsable (detalle) -->
                                        <tr id="det-<%# Eval("id_funcionario") %>" class="collapse" data-bs-parent="#tablaFuncionarios">
                                            <td colspan="5">
                                                <div class="employee-card p-3">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <!-- FOTO -->
                                                            <img class="img-thumbnail" style="width: 200px; height: 220px; object-fit: cover"
                                                                src='<%# Eval("rutaFotoMostrar") %>' alt='<%# Eval("nombre_completo") %>' />
                                                        </div>
                                                        <div class="col-md-9">
                                                            <p><strong><%# Eval("nombre_completo") %></strong></p>
                                                            <p><strong>Cargo:</strong> <%# Eval("puesto") %></p>
                                                            <p>
                                                                <strong>Teléfono:</strong>
                                                                <%# string.IsNullOrEmpty(Convert.ToString(Eval("extension"))) ? "" : "2511-" + Eval("extension") %>
                                                            </p>
                                                            <p><strong>Correo:</strong> <a href='mailto:<%# Eval("correo") %>'><%# Eval("correo") %></a></p>
                                                            <p><strong>Unidad:</strong> <%# Eval("unidad.nombre") %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <br />
                        <!-- Etiqueta para mostrar el mensaje "No se encontraron resultados" -->
                        <asp:Label ID="lblNoResults" runat="server" Text="No se encontraron resultados" CssClass="alert alert-warning" Visible="false"></asp:Label>

                        <!-- PAGINADOR -->
                        <!-- PAGINADOR -->
                        <asp:Panel ID="pnlPager" runat="server" Visible="false">
                            <nav aria-label="Page navigation" class="mt-3">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkPrimero" runat="server" CommandName="First" OnCommand="Paging_Command" CssClass="page-link">« Primero</asp:LinkButton>
                                    </li>
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkAnterior" runat="server" CommandName="Prev" OnCommand="Paging_Command" CssClass="page-link">&lt; Anterior</asp:LinkButton>
                                    </li>

                                    <!-- Repeater para números -->
                                    <asp:Repeater ID="rptPager" runat="server">
                                        <ItemTemplate>
                                            <li class="page-item <%# ((bool)Eval("IsCurrent")) ? "active" : "" %>">
                                                <asp:LinkButton runat="server"
                                                    CommandName="Page"
                                                    CommandArgument='<%# Eval("Value") %>'
                                                    OnCommand="Paging_Command"
                                                    CssClass="page-link">
                            <%# Eval("Text") %>
                                                </asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkSiguiente" runat="server" CommandName="Next" OnCommand="Paging_Command" CssClass="page-link">Siguiente &gt;</asp:LinkButton>
                                    </li>
                                    <li class="page-item">
                                        <asp:LinkButton ID="lnkUltimo" runat="server" CommandName="Last" OnCommand="Paging_Command" CssClass="page-link">Último »</asp:LinkButton>
                                    </li>
                                </ul>
                            </nav>
                        </asp:Panel>



                    </div>

                </div>
        </ContentTemplate>
    </asp:UpdatePanel>




    <script>
        function toggleMenu(sectionId) {
            var content = document.getElementById(sectionId);
            if (content.style.display === "none" || content.style.display === "") {
                content.style.display = "block"; // Mostrar sección
            } else {
                content.style.display = "none";  // Ocultar sección
            }
        }

        function toggleDetalle(id) {
            var el = document.getElementById('det-' + id);
            if (!el) return false;
            if (window.bootstrap && bootstrap.Collapse) {
                var inst = bootstrap.Collapse.getOrCreateInstance(el, { toggle: false });
                inst.toggle();
            }
            else if (window.jQuery && typeof jQuery.fn.collapse === 'function') {
                jQuery(el).collapse('toggle');
            }
            else {
                el.classList.toggle('show');
            }
            return false;
        }

    </script>
</asp:Content>
