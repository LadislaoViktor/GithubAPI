using GithubAPI.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GithubAPI.Forms
{
  public partial class Repository : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      dgvRepositories.DataSource = new Item().GetAllRepositories();
      dgvRepositories.DataBind();

      dgvRepositories.Visible = true;
      pnlFormEmpresa.Visible = false;
    }

    protected void btnPesquisar_Click(object sender, EventArgs e)
    {
      ListRepositories repos = new ListRepositories();
      
      if (!string.IsNullOrEmpty(txtRepository.Text.ToString()))
        repos =JsonConvert.DeserializeObject<ListRepositories>(Get(@"https://api.github.com/search/repositories?q="+txtRepository.Text.ToString()));
      new Model.Item().Create(repos);

    }
    public string Get(string uri)
    {
      ServicePointManager.Expect100Continue = true;
      ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

      HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
      request.UserAgent = "name";
      request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
      

      using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
      using (Stream stream = response.GetResponseStream())
      using (StreamReader reader = new StreamReader(stream))
      {
        return reader.ReadToEnd();
      }
    }

    protected void dgvRepositories_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
      try
      {
        pnlFormEmpresa.Visible = true;
        dgvRepositories.Visible = false;

        int myId =Int32.Parse(dgvRepositories.DataKeys[e.NewSelectedIndex].Value.ToString());
        Item item = new Item().GetItembyID(myId);
        PreencherTela(item);
      }
      catch (Exception ex)
      {

        throw ex;
      }
    }
    protected void PreencherTela(Item item)
    {
      txtLanguage.Text = item.language;
      txtName.Text = item.name;
      txtFullName.Text = item.full_name;
      txtDescription.Text = item.description;
      txtCreatedAt.Text = item.created_at.ToLocalTime().ToShortDateString();

    }

    protected void btnPesquisarGrid_Click(object sender, EventArgs e)
    {
      try
      {
        dgvRepositories.DataSource= new Item().GetbyLanguage(txtRepository.Text.ToString());
        dgvRepositories.DataBind();
      }
      catch (Exception ex)
      {

        throw ex;
      }
    }

    protected void btnVoltar_Click(object sender, EventArgs e)
    {
      pnlFormEmpresa.Visible = false;
      dgvRepositories.Visible = true;
    }
  }
}