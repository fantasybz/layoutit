using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MTALayoutitPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["pageid"] != null)
            {
                TenantsPageWS.TenantsPageWebServiceSoapClient tpws = new TenantsPageWS.TenantsPageWebServiceSoapClient();
                int pageid = Convert.ToInt32(Request.QueryString["pageid"].ToString());

                TenantsPageWS.TenantsPage tp = tpws.getTenantsPageByPageId(pageid);

                if (tp != null)
                {
                    this.tenantId.Value = tp.TenantId.ToString();
                    this.userId.Value = tp.CreateUserID.ToString();
                    this.pageId.Value = tp.PageId.ToString();
                    this.pageName.Value = tp.PageName;
                    this.pageFilePath.Value = (tp.PhysicalFileName == null ? "" : tp.PhysicalFileName);
                    this.pageContent.Value = (tp.FileContent == null ? "" : checkFileContent(tp.FileContent));
                    this.layoutitConent.Value = (tp.LayoutitContent == null ? "" : checkFileContent(tp.LayoutitContent));
                }
            }
        }
    }

    private string checkFileContent(string FileContent)
    {
        return (FileContent.Length < 50 ? "" : FileContent);
    }
}