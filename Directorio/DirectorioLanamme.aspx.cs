using AccesoDatos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Directorio
{
    public partial class DirectorioLanamme : System.Web.UI.Page
    {
        #region variables globales
        FuncionarioDatos funcionarioDatos = new FuncionarioDatos();
        // Clase auxiliar para el pager
        private class PageItem
        {
            public string Text { get; set; }
            public string Value { get; set; }
            public bool IsCurrent { get; set; }
        }
        #endregion

        private int PageSize => 15;

        private int CurrentPage
        {
            get
            {
                object o = ViewState["CurrentPage"];
                return (o == null) ? 0 : (int)o;
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar todos los funcionarios inicialmente
                cargaListaFuncionarios(null);
            }
        }

        private List<Funcionario> GetAllFuncionarios()
        {
            // Obtiene siempre la lista completa desde la fuente y la guarda en Session
            var lista = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path);
            Session["listaFuncionarios"] = lista;
            return lista;
        }

        private List<Funcionario> GetFuncionariosFromSession()
        {
            var lista = Session["listaFuncionarios"] as List<Funcionario>;
            if (lista == null)
                lista = GetAllFuncionarios();
            return lista;
        }

        private void cargaListaFuncionarios(string unidad)
        {
            List<Funcionario> listaFuncionarios;

            if (!string.IsNullOrEmpty(unidad))
            {
                // Filtrar los funcionarios por unidad
                listaFuncionarios = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path)
                                    .Where(f => f.Unidad?.nombre == unidad).ToList();
            }
            else
            {
                // Cargar todos los funcionarios
                listaFuncionarios = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path);
            }

            Session["listaFuncionarios"] = listaFuncionarios;

            // resetear página al cambiar filtro
            CurrentPage = 0;
            BindFuncionariosPage();
        }

        private void BindFuncionariosPage()
        {
            var lista = GetFuncionariosFromSession() ?? new List<Funcionario>();

            if (lista.Count == 0)
            {
                lblNoResults.Visible = true;
                rpFuncionarios.DataSource = null;
                rpFuncionarios.DataBind();

                rptPager.DataSource = null;
                rptPager.DataBind();

                pnlPager.Visible = false; // 🔹 Ocultar el paginador
                return;
            }

            lblNoResults.Visible = false;
            pnlPager.Visible = true; // 🔹 Mostrar el paginador si hay resultados

            var pds = new PagedDataSource();
            pds.DataSource = lista;
            pds.AllowPaging = true;
            pds.PageSize = PageSize;
            pds.CurrentPageIndex = CurrentPage;

            rpFuncionarios.DataSource = pds;
            rpFuncionarios.DataBind();

            // Actualiza el paginador (botones)
            UpdatePager(lista.Count);
        }


        private void UpdatePager(int totalItems)
        {
            int totalPages = (int)Math.Ceiling((double)totalItems / PageSize);
            if (totalPages == 0) totalPages = 1;

            // ventana de 5 páginas
            int windowSize = 5;
            int start = Math.Max(0, CurrentPage - windowSize / 2);
            int end = Math.Min(totalPages - 1, start + windowSize - 1);

            // ajustar start si end - start < windowSize-1
            if (end - start < windowSize - 1)
            {
                start = Math.Max(0, end - (windowSize - 1));
            }

            var pages = new List<PageItem>();
            for (int i = start; i <= end; i++)
            {
                pages.Add(new PageItem
                {
                    Text = (i + 1).ToString(),
                    Value = i.ToString(),
                    IsCurrent = (i == CurrentPage)
                });
            }

            rptPager.DataSource = pages;
            rptPager.DataBind();

            // habilitar/deshabilitar enlaces de navegación
            lnkPrimero.Enabled = CurrentPage > 0;
            lnkAnterior.Enabled = CurrentPage > 0;
            lnkSiguiente.Enabled = CurrentPage < totalPages - 1;
            lnkUltimo.Enabled = CurrentPage < totalPages - 1;
        }

        protected void FiltroUnidad(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string unidad = btn.CommandArgument;

            if (unidad == "Todos")
            {
                // Recuperar todos los funcionarios
                cargaListaFuncionarios(null);
            }
            else
            {
                // Filtrar y cargar la lista de funcionarios según el departamento seleccionado
                cargaListaFuncionarios(unidad);
            }
        }

        // Método para buscar
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string buscar = txtBuscar.Text.Trim();

            // Verificar si el campo de búsqueda no está vacío
            if (!string.IsNullOrEmpty(buscar))
            {
                // Filtrar funcionarios por nombre, puesto o unidad
                var listaFiltrada = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path)
                                    .Where(f =>
                                        (f.nombre_completo ?? "").IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                        (f.Unidad?.nombre ?? "").IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                        (f.puesto ?? "").IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0
                                    ).ToList();

                Session["listaFuncionarios"] = listaFiltrada;
                CurrentPage = 0;
                BindFuncionariosPage();
            }
            else
            {
                // Si el campo de búsqueda está vacío, mostrar todos los funcionarios
                cargaListaFuncionarios(null);
            }
        }

        // Comando del paginador (First, Prev, Page, Next, Last)
        protected void Paging_Command(object sender, CommandEventArgs e)
        {
            var lista = GetFuncionariosFromSession();
            int totalItems = (lista != null) ? lista.Count : 0;
            int totalPages = (int)Math.Ceiling((double)totalItems / PageSize);

            switch (e.CommandName)
            {
                case "First":
                    CurrentPage = 0;
                    break;
                case "Prev":
                    if (CurrentPage > 0) CurrentPage--;
                    break;
                case "Next":
                    if (CurrentPage < totalPages - 1) CurrentPage++;
                    break;
                case "Last":
                    CurrentPage = Math.Max(0, totalPages - 1);
                    break;
                case "Page":
                    int pageIndex;
                    if (int.TryParse(Convert.ToString(e.CommandArgument), out pageIndex))
                    {
                        CurrentPage = Math.Max(0, Math.Min(totalPages - 1, pageIndex));
                    }
                    break;
            }

            BindFuncionariosPage();
        }
    }
}
