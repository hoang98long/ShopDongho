namespace WebMVCWatchOnline.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NewsFeed")]
    public partial class NewsFeed
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        public string Content { get; set; }

        public int? CreatedBy { get; set; }

        [StringLength(350)]
        public string Image { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
