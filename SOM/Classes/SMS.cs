using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace SOM.Classes
{
    public class SMS
    {
        public string SendSMS(string strRecip, string strMsgText)
        {

            Uri objURI = new Uri("http://api.urlsms.com/SendSMS.aspx?UserID=demo6@urlsms.com&Password=demo@2707&SenderID=URLSMS&MsgText="+strMsgText+"&RecipientMobileNo="+strRecip);
            WebRequest objWebRequest = WebRequest.Create(objURI);
            WebResponse objWebResponse = objWebRequest.GetResponse();
            Stream objStream = objWebResponse.GetResponseStream();
            StreamReader objStreamReader = new StreamReader(objStream);
            string strHTML = objStreamReader.ReadToEnd();

            return strHTML;

        }
    }
}