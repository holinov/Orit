// Type: iTextSharp.text.html.simpleparser.StyleSheet
// Assembly: itextsharp, Version=5.2.1.0, Culture=neutral, PublicKeyToken=8354ae6d2174ddca
// Assembly location: C:\Users\holinov\Documents\Visual Studio 2010\Projects\Orit.EgrulViewer\itextsharp.dll

using iTextSharp.text;
using iTextSharp.text.html;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.util;

namespace iTextSharp.text.html.simpleparser
{
  public class StyleSheet
  {
    protected internal IDictionary<string, IDictionary<string, string>> tagMap = (IDictionary<string, IDictionary<string, string>>) new Dictionary<string, IDictionary<string, string>>();
    protected internal IDictionary<string, IDictionary<string, string>> classMap = (IDictionary<string, IDictionary<string, string>>) new Dictionary<string, IDictionary<string, string>>();

    public void LoadTagStyle(string tag, IDictionary<string, string> attrs)
    {
      this.tagMap[tag.ToLowerInvariant()] = attrs;
    }

    public void LoadTagStyle(string tag, string key, string value)
    {
      tag = tag.ToLowerInvariant();
      IDictionary<string, string> dictionary;
      this.tagMap.TryGetValue(tag, out dictionary);
      if (dictionary == null)
      {
        dictionary = (IDictionary<string, string>) new Dictionary<string, string>();
        this.tagMap[tag] = dictionary;
      }
      dictionary[key] = value;
    }

    public void LoadStyle(string className, Dictionary<string, string> attrs)
    {
      this.classMap[className.ToLowerInvariant()] = (IDictionary<string, string>) attrs;
    }

    public void LoadStyle(string className, string key, string value)
    {
      className = className.ToLowerInvariant();
      IDictionary<string, string> dictionary;
      this.classMap.TryGetValue(className, out dictionary);
      if (dictionary == null)
      {
        dictionary = (IDictionary<string, string>) new Dictionary<string, string>();
        this.classMap[className] = dictionary;
      }
      dictionary[key] = value;
    }

    public void ApplyStyle(string tag, IDictionary<string, string> attrs)
    {
      IDictionary<string, string> dictionary1;
      this.tagMap.TryGetValue(tag.ToLowerInvariant(), out dictionary1);
      if (dictionary1 != null)
      {
        IDictionary<string, string> dictionary2 = (IDictionary<string, string>) new Dictionary<string, string>(dictionary1);
        foreach (KeyValuePair<string, string> keyValuePair in (IEnumerable<KeyValuePair<string, string>>) attrs)
          dictionary2[keyValuePair.Key] = keyValuePair.Value;
        foreach (KeyValuePair<string, string> keyValuePair in (IEnumerable<KeyValuePair<string, string>>) dictionary2)
          attrs[keyValuePair.Key] = keyValuePair.Value;
      }
      string str;
      attrs.TryGetValue("class", out str);
      if (str == null)
        return;
      this.classMap.TryGetValue(str.ToLowerInvariant(), out dictionary1);
      if (dictionary1 == null)
        return;
      attrs.Remove("class");
      IDictionary<string, string> dictionary3 = (IDictionary<string, string>) new Dictionary<string, string>(dictionary1);
      foreach (KeyValuePair<string, string> keyValuePair in (IEnumerable<KeyValuePair<string, string>>) attrs)
        dictionary3[keyValuePair.Key] = keyValuePair.Value;
      foreach (KeyValuePair<string, string> keyValuePair in (IEnumerable<KeyValuePair<string, string>>) dictionary3)
        attrs[keyValuePair.Key] = keyValuePair.Value;
    }

    public static void ResolveStyleAttribute(IDictionary<string, string> h, ChainedProperties chain)
    {
      string str1;
      h.TryGetValue("style", out str1);
      if (str1 == null)
        return;
      Properties properties = HtmlUtilities.ParseAttributes(str1);
      foreach (string index in properties.Keys)
      {
        if (index.Equals("font-family"))
          h["face"] = properties[index];
        else if (index.Equals("font-size"))
        {
          float actualFontSize = HtmlUtilities.ParseLength(chain["size"], 12f);
          if ((double) actualFontSize <= 0.0)
            actualFontSize = 12f;
          h["size"] = HtmlUtilities.ParseLength(properties[index], actualFontSize).ToString((IFormatProvider) CultureInfo.InvariantCulture) + "pt";
        }
        else if (index.Equals("font-style"))
        {
          string str2 = properties[index].Trim().ToLowerInvariant();
          if (str2.Equals("italic") || str2.Equals("oblique"))
            h["i"] = (string) null;
        }
        else if (index.Equals("font-weight"))
        {
          string str2 = properties[index].Trim().ToLowerInvariant();
          if (str2.Equals("bold") || str2.Equals("700") || (str2.Equals("800") || str2.Equals("900")))
            h["b"] = (string) null;
        }
        else if (index.Equals("text-decoration"))
        {
          if (properties[index].Trim().ToLowerInvariant().Equals("underline"))
            h["u"] = (string) null;
        }
        else if (index.Equals("color"))
        {
          BaseColor baseColor = HtmlUtilities.DecodeColor(properties[index]);
          if (baseColor != null)
          {
            string str2 = "000000" + baseColor.ToArgb().ToString("x");
            string str3 = "#" + str2.Substring(str2.Length - 6);
            h["color"] = str3;
          }
        }
        else if (index.Equals("line-height"))
        {
          string s2 = properties[index].Trim();
          float actualFontSize = HtmlUtilities.ParseLength(chain["size"], 12f);
          if ((double) actualFontSize <= 0.0)
            actualFontSize = 12f;
          float num = HtmlUtilities.ParseLength(properties[index], actualFontSize);
          if (s2.EndsWith("%"))
          {
            h["leading"] = "0," + (object) (float) ((double) num / 100.0);
            break;
          }
          else if (Util.EqualsIgnoreCase("normal", s2))
          {
            h["leading"] = "0,1.5";
            break;
          }
          else
            h["leading"] = (string) (object) num + (object) ",0";
        }
        else if (index.Equals("text-align"))
        {
          string str2 = properties[index].Trim().ToLowerInvariant();
          h["align"] = str2;
        }
        else if (index.Equals("padding-left"))
        {
          string str2 = properties[index].Trim().ToLowerInvariant();
          h["indent"] = HtmlUtilities.ParseLength(str2).ToString((IFormatProvider) CultureInfo.InvariantCulture);
        }
      }
    }
  }
}
