﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HMSB
{
    public partial class frmPatientInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFile)
            {
                string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["picture"] = fileName;
            }
        }
    }
}