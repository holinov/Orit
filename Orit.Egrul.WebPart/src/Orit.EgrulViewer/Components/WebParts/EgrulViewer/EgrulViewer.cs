// <copyright file="EgrulViewer.cs" company="Orit">
// Copyright Orit. All rights reserved.
// </copyright>
// <author>NVXLAB\holinov</author>
// <date>2012-04-11 13:05:54Z</date>

using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.ServiceModel;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Xml.XPath;
using System.Xml.Xsl;
using EO.Pdf;
using Microsoft.SharePoint.WebPartPages;
using Orit.EgrulViewer.Components.Gate2FNSService;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;


namespace Orit.EgrulViewer.Components
{
    using System;
    using System.Collections.Generic;
    using System.Runtime.InteropServices;
    using System.Security.Permissions;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls.WebParts;
    using Microsoft.SharePoint;
    using Microsoft.SharePoint.Security;

    /// <summary>
    /// TODO: Add comment for webpart EgrulViewer
    /// </summary>
    [SharePointPermission(SecurityAction.LinkDemand, ObjectModel = true)]
    [SharePointPermission(SecurityAction.InheritanceDemand, ObjectModel = true)]
    public class EgrulViewer : WebPart
    {
        private const string ASCXPATH = @"/_CONTROLTEMPLATES/Orit_EgrulViewer/EgrulViewerUserControl.ascx";

        private UserControl userControl;
        private System.Web.UI.WebControls.TextBox txtField;
        private System.Web.UI.WebControls.Button showButton;
        private Label resultLabel;
        private Xml xmlResult;
        private RadioButtonList LType;
        private RadioButtonList RType;
        private Button GetPdfButton;
        private string _documentContent;
        private XslTransform xmlTransform;
        private MemoryStream xmlStream;
        private static string style= @"<style type=""text/css"">
    .infoblock table caption {
        margin-top: 20px;
        margin-bottom: 15px;
    }
</style>";
        //private Timer UpdateTimer;

        public EgrulViewer()
        {
        }

        protected override void CreateChildControls()
        {
            userControl = (UserControl)this.Page.LoadControl(ASCXPATH);

            txtField = (System.Web.UI.WebControls.TextBox)this.userControl.FindControl("TextBox1");
            showButton = (System.Web.UI.WebControls.Button)this.userControl.FindControl("Button1");
            showButton.Click += new EventHandler(ShowButton_Click);

            resultLabel = (Label) userControl.FindControl("Label2");
            xmlResult = (Xml) userControl.FindControl("xmlResult");
            LType = (RadioButtonList) userControl.FindControl("LType");
            RType = (RadioButtonList) userControl.FindControl("RType");
            GetPdfButton = (Button) userControl.FindControl("Button2");
            GetPdfButton.Click += new EventHandler(GetPdfButton_Click);
            //UpdateTimer = (Timer) userControl.FindControl("updateTimer");
            //UpdateTimer.Tick += new EventHandler<EventArgs>(UpdateTimer_Tick);
            Controls.Add(userControl);

            base.CreateChildControls();
        }

        void GetPdfButton_Click(object sender, EventArgs e)
        {
            ShowButton_Click(sender, e);
            RenderCurrentPdf();
        }

        private void RenderCurrentPdf()
        {
            xmlStream.Position = 0;
            var doc = new XmlDocument();
            doc.LoadXml(_documentContent);

            //var docXml=doc.CreateNavigator().ReadSubtree().ReadOuterXml();

            using(var resultStream=new MemoryStream())
            {
                xmlTransform.Transform(doc, null,resultStream);
                resultStream.Position = 0;
                //var xhtml = new SqlXml(resultStream);
                var sr = new StreamReader(resultStream);
                var xhtmlValue = sr.ReadToEnd();

                //RenderWithEO(xhtmlValue);
                RenderWithIText(xhtmlValue);
            }
        }

        private readonly string htmlStart = @"<!DOCTYPE html PUBLIC ""-//W3C//DTD XHTML 1.0 Transitional//EN"" ""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"">
<html xmlns=""http://www.w3.org/1999/xhtml"">
<head>
    <meta http-equiv=""Pragma"" content=""no-cache"" />
    <meta http-equiv=""cache-control"" content=""no-cache"" />
</head>
<body style=""font-family: Arial, Helvetica, sans-serif; font-size: 1em; margin: 0;
    padding: 0;"">";
        private readonly string htmlEnd=@"</body>
</html>";
        private void RenderWithIText(string xhtmlValue)
        {

            var resp = HttpContext.Current.Response;
            resp.Clear();
            resp.ClearHeaders();
            resp.ContentType = "application/pdf";
            resp.AddHeader("Content-Disposition", "attachment; filename=Vipiska.pdf");

            using (Document document = new Document())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, resp.OutputStream);
                document.Open();
                try
                {
                    var fullHtml = htmlStart + style + xhtmlValue + htmlEnd;
                    StringReader sr = new StringReader(fullHtml);
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, document, sr);
                }
                catch (Exception e)
                {
                    throw;
                }
            }

            
           /* var styleSheet=new StyleSheet();
            //styleSheet.

            Document document = new Document();
            PdfWriter.GetInstance(document, resp.OutputStream);
            document.Open();                        
            var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(xhtmlValue),styleSheet);
            //add the collection to the document
            for (int k = 0; k < htmlarraylist.Count; k++)
            {
                document.Add((IElement)htmlarraylist[k]);
            }
            document.Close();*/
            resp.End();
        }
        /*
        private static void RenderWithEO(string xhtmlValue)
        {
            var pdf = new PdfDocument();
            HtmlToPdf.ConvertHtml(style+xhtmlValue, pdf);

            var resp = HttpContext.Current.Response;
            resp.Clear();
            resp.ClearHeaders();
            resp.ContentType = "application/pdf";
            resp.AddHeader("Content-Disposition", "attachment; filename=Vipiska.pdf");
            pdf.Save(resp.OutputStream);
            resp.End();
        }

        void UpdateTimer_Tick(object sender, EventArgs e)
        {
            //if(UpdateTimerEnabled)
            //{
            //    UpdateTimer.Enabled = false;
            //    UpdateEgrulInfo();
                
            //}
        }*/

        protected override void Render(HtmlTextWriter writer)
        {
            this.RenderContents(writer);
        }

        private string _serviceEndpoint = @"http://193.46.207.196:8000/Gate2FNSService.svc";

        [WebBrowsable(true)]
        [WebDisplayName(@"Адрес гейта ЕГЛЮЛ")]
        [SPWebCategoryName(@"Гейт")]
        [WebPartStorage(Storage.Shared)]
        [WebDescription(@"Адрес гейта для получения выписок из ЕГРЮЛ\ЕГРИП")]
        [Personalizable(PersonalizationScope.Shared)]
        public string ServiceEndpoint
        {
            get { return _serviceEndpoint; }
            set { _serviceEndpoint = value; }
        }

        internal Gate2FNSServiceClient CreateWebServiceInstance()
        {
            BasicHttpBinding binding = new BasicHttpBinding();
            // I think most (or all) of these are defaults--I just copied them from app.config:
            binding.SendTimeout = TimeSpan.FromMinutes(1);
            binding.OpenTimeout = TimeSpan.FromMinutes(1);
            binding.CloseTimeout = TimeSpan.FromMinutes(1);
            binding.ReceiveTimeout = TimeSpan.FromMinutes(10);
            binding.AllowCookies = false;
            binding.BypassProxyOnLocal = false;
            binding.HostNameComparisonMode = HostNameComparisonMode.StrongWildcard;
            binding.MessageEncoding = WSMessageEncoding.Text;
            binding.TextEncoding = System.Text.Encoding.UTF8;
            binding.TransferMode = TransferMode.Buffered;
            binding.UseDefaultWebProxy = true;
            return new Gate2FNSServiceClient(binding, new EndpointAddress(ServiceEndpoint));
        }
        private ItemChoiceType DetectIdType(string id)
        {
            if(id.Length==10)
            {
                return ItemChoiceType.ИННЮЛ;
            }
            return ItemChoiceType.ОГРН;            
        }
        private string GetULShort(string id)
        {
            var sb = new StringBuilder();
            var service = CreateWebServiceInstance();
            sb.AppendLine("123");

            var res = service.GetShortInfo_UL(txtField.Text, DetectIdType(id));
            var gi = res.GateInfoORДокументОтвет as GateInfo;
            var doc = res.GateInfoORДокументОтвет as ДокументОтвет;
            sb.AppendLine(res.ToString()).AppendLine();

            if (gi != null)
            {
                sb.AppendLine("Gate return code: " + gi.GateReturnCode.ToString());
                sb.AppendLine("Request Id: " + gi.RequestId);

                //UpdateTimer.Enabled = true;
            }

            SqlXml xml=new SqlXml();
            if (doc != null)
            {
                sb.AppendFormat(@"<br\>ItemField: {0} = {1}", doc.itemField.GetType().Name, doc.itemField);
                sb.AppendLine(@"<br\>Дата выписки: " + doc.датаВыпField);
                sb.AppendLine(@"<br\>Ид запроса: " + doc.идЗапросField);


                MemoryStream stream = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(doc.itemField.GetType());
                serializer.Serialize(stream, doc.itemField);
                // reset the stream to the beginning
                stream.Position = 0;
                xml = new SqlXml(stream);
                //resultLabel.Text = sb.ToString();                
            }

            return xml.IsNull?"":xml.Value;
        }

        protected bool UpdateTimerEnabled { get; set; }

        private string GetULLong(string id)
        {
            var sb = new StringBuilder();
            var service = CreateWebServiceInstance();
            sb.AppendLine("123");
            var res1 = service.RequestGetLongInfo_UL(id, DetectIdType(id), id);

            
            //var res = service.GetLongInfo_UL(id);            
            var gi = res1.GateInfoORДокумент5 as GateInfo;
            var doc = res1.GateInfoORДокумент5 as Документ5;
            sb.AppendLine(res1.ToString()).AppendLine();
            SqlXml xml = new SqlXml();

            if (gi != null)
            {
                sb.AppendLine("Gate return code: " + gi.GateReturnCode.ToString());
                sb.AppendLine("Request Id: " + gi.RequestId);
                resultLabel.Text = "Загрузка данных";
                //UpdateTimer.Enabled = true;

                if (gi.GateReturnCode == GateReturnCode.RequestAcceptedByFNS)
                {
                    System.Threading.Thread.Sleep(30000);
                    var doc1 = service.GetLongInfo_UL(gi.RequestId);
                    doc = doc1.GateInfoORДокумент5 as Документ5;
                    GetPdfButton.Visible = true;
                }
            }

            if (doc != null)
            {
                resultLabel.Text = "";
                MemoryStream stream = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(doc.GetType());
                serializer.Serialize(stream, doc);
                // reset the stream to the beginning
                stream.Position = 0;
                xml = new SqlXml(stream);
                txtField.Enabled = true;
                stream.Position = 0;
                xmlStream = stream;              
            }

            return xml.IsNull?"":xml.Value;
        }
        
        protected void ShowButton_Click(object sender, EventArgs e)
        {
            txtField.Enabled = false;
            GetPdfButton.Visible = true;
            UpdateEgrulInfo();
            //txtField.Text = "Hello World";
        }

        private void UpdateEgrulInfo()
        {
            try
            {
                var ltype = LType.SelectedValue; //Юр. лица|Физ. лица
                var rtype = RType.SelectedValue; //Короткая|Длинная
                long egrulId;
                if (long.TryParse(txtField.Text, out egrulId))
                {
                    if (ltype == "Юр. лица")
                    {
                        if (rtype == "Короткая")
                        {
                            _documentContent = GetULShort(txtField.Text);
                            xmlResult.DocumentContent = _documentContent;
                            ApplyXslt("ULShort");

                            txtField.Enabled = true;
                            GetPdfButton.Visible = true;
                            //XmlReader.Create()
                        }
                        else
                        {
                            _documentContent = GetULLong(txtField.Text);
                            xmlResult.DocumentContent = _documentContent;
                            ApplyXslt("ULLong");
                        }
                    }
                    else
                    {
                        if (rtype == "Короткая")
                        {
                            xmlResult.DocumentContent = GetFLShort(txtField.Text);
                            ApplyXslt("FLShort");
                            txtField.Enabled = true;
                            GetPdfButton.Visible = true;
                        }
                        else
                        {
                            xmlResult.DocumentContent = GetFLLong(txtField.Text);
                            ApplyXslt("FLLong");
                        }
                    }
                }
                else
                {
                    resultLabel.Text = @"Неверный ИНН\ОРГН";
                    txtField.Enabled = true;
                    GetPdfButton.Visible = false;
                    //UpdateTimer.Enabled = false;
                }
            }catch(System.ServiceModel.FaultException fault)
            {
                resultLabel.Text = @"Сервис получения выписок из ЕГРЮЛ\ЕГРИП временно недоступен";
                txtField.Enabled = true;
                GetPdfButton.Visible = false;
            }
        }

        private void ApplyXslt(string templateName)
        {
            SPDocumentLibrary templatesList =
                (SPDocumentLibrary) SPContext.Current.Web.Lists[@"Шаблоны выписок ЕГРЮЛ\ЕГРИП"];
            var template =
                templatesList.Items.Cast<SPListItem>().FirstOrDefault(item =>
                                                                      item.File.Exists
                                                                      && item.File.Name == templateName + ".xslt");
            
            if (template != null && template.File.Exists)
            {
                var xmlReader = XmlReader.Create(template.File.OpenBinaryStream());
                var transform = new XslTransform();
                transform.Load(xmlReader);
                xmlResult.Transform = transform;
                xmlTransform = transform;
            }
        }

        private string GetFLLong(string id)
        {
            var sb = new StringBuilder();
            var service = CreateWebServiceInstance();
            var res1 = service.RequestGetLongInfo_FL(id, DetectIdTypeFL(id), id);


            //var res = service.GetLongInfo_UL(id);            
            var gi = res1.GateInfoORДокумент9 as GateInfo;
            var doc = res1.GateInfoORДокумент9 as Документ9;
            sb.AppendLine(res1.ToString()).AppendLine();
            SqlXml xml = new SqlXml();

            if (gi != null)
            {
                sb.AppendLine("Gate return code: " + gi.GateReturnCode.ToString());
                sb.AppendLine("Request Id: " + gi.RequestId);
                resultLabel.Text = "Загрузка данных";
                //UpdateTimer.Enabled = true;

                if (gi.GateReturnCode == GateReturnCode.RequestAcceptedByFNS)
                {
                    System.Threading.Thread.Sleep(30000);
                    var doc1 = service.GetLongInfo_FL(gi.RequestId);
                    doc = doc1.GateInfoORДокумент9 as Документ9;
                    GetPdfButton.Visible = true;
                }
            }

            if (doc != null)
            {
                resultLabel.Text = "";
                MemoryStream stream = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(doc.GetType());
                serializer.Serialize(stream, doc.свИПField);
                // reset the stream to the beginning
                stream.Position = 0;
                xml = new SqlXml(stream);
                txtField.Enabled = true;
                stream.Position = 0;
                xmlStream = stream;
                //UpdateTimer.Enabled = false;
                //resultLabel.Text = sb.ToString();                
            }

            return xml.IsNull ? "" : xml.Value;
        }

        private string GetFLShort(string id)
        {
            var sb = new StringBuilder();
            var service = CreateWebServiceInstance();
            //sb.AppendLine("123");

            var res = service.GetShortInfo_FL(txtField.Text, DetectIdTypeFL(id));
            var gi = res.GateInfoORДокументОтвет1 as GateInfo;
            var doc = res.GateInfoORДокументОтвет1 as ДокументОтвет1;
            sb.AppendLine(res.ToString()).AppendLine();

            if (gi != null)
            {
                sb.AppendLine("Gate return code: " + gi.GateReturnCode.ToString());
                sb.AppendLine("Request Id: " + gi.RequestId);

                //UpdateTimer.Enabled = true;
            }

            SqlXml xml = new SqlXml();
            if (doc != null)
            {
                sb.AppendFormat(@"<br\>ItemField: {0} = {1}", doc.itemField.GetType().Name, doc.itemField);
                sb.AppendLine(@"<br\>Дата выписки: " + doc.датаВыпField);
                sb.AppendLine(@"<br\>Ид запроса: " + doc.идЗапросField);


                MemoryStream stream = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(doc.GetType());
                serializer.Serialize(stream, doc);
                // reset the stream to the beginning
                stream.Position = 0;
                xml = new SqlXml(stream);
                //resultLabel.Text = sb.ToString();                
            }

            return xml.IsNull ? "" : xml.Value;
        }

        private ItemChoiceType4 DetectIdTypeFL(string id)
        {

            if (id.Length == 12)
            {
                return ItemChoiceType4.ИНН;
            }
            return ItemChoiceType4.ОГРНИП;
        }
    }
}

