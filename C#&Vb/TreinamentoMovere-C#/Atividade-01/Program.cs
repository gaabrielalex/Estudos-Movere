using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atividade_01
{
	internal class Program
	{
		static void Main(string[] args)
		{
			string teste = "Olá mundo  novo";
			int lengthTeste = teste.Length;

			for(int i = 0;  i < teste.Length; i++) {
				Console.WriteLine(teste.Substring(0, lengthTeste - i));
			}
		}
	}
}
