using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TesteVirtualC_
{
	internal class Pessoa
	{
		public void falarOi(){
			Console.WriteLine("Oi");
		}

		public virtual void falarTchau()
		{
			Console.WriteLine("Tchau");
		}
	}
}
