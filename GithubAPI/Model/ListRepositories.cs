using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GithubAPI.Model
{
  public class ListRepositories
  {
    public int total_count { get; set; }
    public bool incomplete_results { get; set; }
    [JsonProperty("items")]
    public List<Item> items { get; set; }
  }
}