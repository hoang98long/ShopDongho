namespace WebMVCWatchOnline.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User ")]
    public partial class User_
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [StringLength(500)]
        public string Name { get; set; }

        [StringLength(500)]
        public string UserName { get; set; }

        [StringLength(500)]
        public string Password { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? Status { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public int? Group_ID { get; set; }
    }
}
