using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APSM1_AloMundo
{
	public partial class OlaMundo : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btExecutar_Click(object sender, EventArgs e)
        {
			if(txtMsg.Text ==""){
				lMsg.Text = "<h1>Alô Mundo - Aula 1</h1>";
			} else {
				lMsg.Text = "<h1>" + txtMsg.Text + "</h1>";
			}
        }
    }
}