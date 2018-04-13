using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GithubAPI.Model
{
  public class License
  {
    [Key]
    public int myId { get; set; }
    public virtual Item Item { get; set; }
    public string key { get; set; }
    public string name { get; set; }
    public string spdx_id { get; set; }
    public string url { get; set; }
    public string html_url { get; set; }
  }
}