using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proba4.Model
{
    public class Person
    {
        public long Id { get; set; }
        public int Type { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Country { get; set; }



        public Person() { }

        public Person(string name, string surname, string email, string password,string country)
        {
            this.Name = name;
            this.Surname = surname;
            this.Email = email;
            this.Password = password;
            this.Country = country;
        }

        public override string ToString()
        {
            base.ToString();
            return "name: " + Name + ", surname: " + Surname +
                ", email: " + Email + ", password: " + Password + ", country: " + Country;
        }
    }
}