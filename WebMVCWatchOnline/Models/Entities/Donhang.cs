using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVCWatchOnline.Models.Entities
{
    public class Donhang
    {
        public List<Bill> DonHangChuaDuyet { get; set; }
        public List<Bill> DonHangDaDuyet { get; set; }
    }
}