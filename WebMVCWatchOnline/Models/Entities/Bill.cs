namespace WebMVCWatchOnline.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int Customer_Id { get; set; }

        public double? TotalMoney { get; set; }

        public DateTime? Date { get; set; }

        public int? Status { get; set; }

        [StringLength(50)]
        public string Customer_Name { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Number_phone { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
