using AccesoDatos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Directorio
{
    public partial class DirectorioLanamme : System.Web.UI.Page
    {
        
        #region variables globales
        FuncionarioDatos funcionarioDatos = new FuncionarioDatos();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar todos los funcionarios inicialmente
                cargaListaFuncionarios(null);
            }
        }

        private void cargaListaFuncionarios(string unidad)
        {
            List<Funcionario> listaFuncionarios;
           
            if (!string.IsNullOrEmpty(unidad))
            {
                // Filtrar los funcionarios por unidad
                listaFuncionarios = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path).Where(f => f.Unidad.nombre == unidad).ToList();
            }
            else
            {
                // Cargar todos los funcionarios
                listaFuncionarios = funcionarioDatos.getFuncionarios(Utilidades.no_foto_path);
            }

            Session["listaFuncionarios"] = listaFuncionarios;

            rpFuncionarios.DataSource = listaFuncionarios;
            rpFuncionarios.DataBind();
        }

        // Método para manejar el evento de filtrado por unidad
        protected void FiltroUnidad(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string unidad = btn.CommandArgument;

            if (unidad == "Todos")
            {
                // Recuperar todos los funcionarios
                cargaListaFuncionarios(null);
                lblNoResults.Visible = false;
            }
            else
            {
                // Filtrar y cargar la lista de funcionarios según el departamento seleccionado
                cargaListaFuncionarios(unidad);
                List<Funcionario> listaFuncionarios = (List<Funcionario>)Session["listaFuncionarios"];

                lblNoResults.Visible = listaFuncionarios.Count == 0;
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
                                    .Where(f => f.nombre_completo.IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0 ||
                                                f.Unidad.nombre.IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0)
                                    .ToList();

                // Cargar la lista filtrada de funcionarios
                rpFuncionarios.DataSource = listaFiltrada;
                rpFuncionarios.DataBind();

                // Verificar si hay resultados o no
                if (listaFiltrada.Count == 0)
                {
                    lblNoResults.Visible = true;  // Mostrar mensaje si no se encontraron resultados
                }
                else
                {
                    lblNoResults.Visible = false; // Ocultar mensaje si hay resultados
                }
            }
            else
            {
                // Si el campo de búsqueda está vacío, mostrar todos los funcionarios
                cargaListaFuncionarios(null);
                lblNoResults.Visible = false; // Asegurarse de que el mensaje esté oculto al mostrar todos los resultados
            }
        }
    }
}