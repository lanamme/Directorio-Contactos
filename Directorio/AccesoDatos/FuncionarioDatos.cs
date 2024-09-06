using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace AccesoDatos
{
    public class FuncionarioDatos
    {
        private ConexionDatos conexion = new ConexionDatos();

        /// <summary>
        /// Ana Vega
        /// 04/09/2024
        /// Efecto: obtiene todas los funcionarios de la base de datos
        /// Requiere: -
        /// Modifica: -
        /// Devuelve: lista de funcionarios
        /// </summary>
        /// <returns></returns>
        public List<Funcionario> getFuncionarios(String ruta_no_foto)
        {
            SqlConnection sqlConnection = conexion.conexionBaseDatos();
            List<Funcionario> listaFuncionarios = new List<Funcionario>();

            // Actualización de la consulta con el INNER JOIN para incluir la información de Unidad
            String consulta = @"SELECT F.id_funcionario, F.ruta_foto, F.numero_identificacion, F.nombre_completo,
                               F.correo, F.numero_telefono_celular, F.observaciones, F.extension,
                               F.fecha_ingreso_laborar, F.puesto, F.colegio_profesional, F.numero_colegiado,
                               F.activo, U.id_unidad, U.sigla, U.nombre AS nombre_unidad, U.activo AS activo_unidad
                        FROM Funcionario F
                        INNER JOIN Unidad U ON F.id_unidad = U.id_unidad
                        WHERE F.activo = 1
                        ORDER BY F.nombre_completo;";

            SqlCommand sqlCommand = new SqlCommand(consulta, sqlConnection);

            SqlDataReader reader;
            sqlConnection.Open();
            reader = sqlCommand.ExecuteReader();

            while (reader.Read())
            {
                Funcionario funcionario = new Funcionario();

                // Llenar los datos del Funcionario
                funcionario.id_funcionario = Convert.ToInt32(reader["id_funcionario"]);
                funcionario.nombre_completo = reader["nombre_completo"].ToString();

                string filepath = reader["ruta_foto"].ToString();

                if (filepath.Trim() == "")
                {
                    filepath = ruta_no_foto;
                }

                byte[] imageArray = System.IO.File.ReadAllBytes(filepath);
                string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                string rutaFotografia = $"data: image/png; base64,{base64ImageRepresentation}";

                funcionario.ruta_foto = reader["ruta_foto"].ToString();
                funcionario.rutaFotoMostrar = rutaFotografia;


                funcionario.numero_identificacion = reader["numero_identificacion"].ToString();
                funcionario.correo = reader["correo"].ToString();
                funcionario.numero_telefono_celular = reader["numero_telefono_celular"].ToString();
                funcionario.observaciones = reader["observaciones"].ToString();
                funcionario.extension = reader["extension"].ToString();

                if (reader["fecha_ingreso_laborar"] != DBNull.Value)
                {
                    funcionario.fecha_ingreso_laborar = Convert.ToDateTime(reader["fecha_ingreso_laborar"]);
                }
                else
                {
                    funcionario.fecha_ingreso_laborar = DateTime.MinValue;
                }

                funcionario.puesto = reader["puesto"].ToString();
                funcionario.colegio_profesional = reader["colegio_profesional"].ToString();
                funcionario.numero_colegiado = reader["numero_colegiado"].ToString();
                funcionario.activo = Convert.ToByte(reader["activo"]);

                // Llenar los datos de la Unidad
                Unidad unidad = new Unidad();
                unidad.id_unidad = Convert.ToInt32(reader["id_unidad"]);
                unidad.sigla = reader["sigla"].ToString();
                unidad.nombre = reader["nombre_unidad"].ToString();
                unidad.activo = Convert.ToByte(reader["activo_unidad"]);

                // Asignar la unidad al funcionario
                funcionario.Unidad = unidad;

                // Agregar el funcionario a la lista
                listaFuncionarios.Add(funcionario);
            }

            sqlConnection.Close();

            return listaFuncionarios;
        }


    }
}
