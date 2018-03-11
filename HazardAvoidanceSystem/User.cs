using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HazardAvoidanceSystem
{
    public class User
    {
        public int id { get; set; }
        public string email { get; set; }
        public string role { get; set; }
        public User(int id, string email, string role)
        {
            this.id = id;
            this.email = email;
            this.role = role;
        }

        public User()
        {

        }
    }
}