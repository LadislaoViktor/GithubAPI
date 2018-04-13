using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GithubAPI.Model
{
  public class Permissions
  {
    public virtual Item Item { get; set; }
    [Key]
    public int myId { get; set; }
    public bool admin { get; set; }
    public bool push { get; set; }
    public bool pull { get; set; }
  }
}