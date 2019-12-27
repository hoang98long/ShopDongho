namespace WebMVCWatchOnline.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("News")]
    public partial class News
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        public string Content { get; set; }

        public int? Uploader { get; set; }

        [StringLength(350)]
        public string Image { get; set; }

        public DateTime? Date { get; set; }
    }
}