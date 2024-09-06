using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Funcionario
    {
        public int id_funcionario { get; set; }
        public String nombre_completo { get; set; }
        public String ruta_foto { get; set; }
        public String numero_identificacion { get; set; }
        public String correo {  get; set; }
        public String numero_telefono_celular { get; set; }
        public String observaciones { get; set; }
        public String extension { get; set; }
        public DateTime fecha_ingreso_laborar { get; set; }
        public String puesto {  get; set; }
        public String colegio_profesional {  get; set; }
        public string numero_colegiado { get; set; }
        public Byte activo {  get; set; }

        public String rutaFotoMostrar { get; set; }
        public Unidad Unidad { get; set; }

    }
}
