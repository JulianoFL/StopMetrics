using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace StopMetrics.Models.DBModels
{
    [Table("login_users")]
    public class DbM_User
    {
        public enum AccountProvider { Email, Google, Facebook }

        public enum RecordingStorageProvider { Youtube }

        [Key]
        public int Id { get; set; }

        [MaxLength(100)]
        public string FirebaseId { get; set; }

        [MaxLength(100)]
        public string Name { get; set; }

        [MaxLength(100)]
        public string Email { get; set; }

        [MaxLength(100)]
        public string RecordingStorageUser { get; set; }

        public string RecordingStoragePassword { get; set; }

        [MaxLength(50)]
        public RecordingStorageProvider RecordingStorageType { get; set; }

        [MaxLength(30)]
        [Column(TypeName = "nvarchar(30)")]
        public AccountProvider Provider { get; set; }

        public DateTime RegisterDate { get; set; }

        public string HashKey { get; set; }

        [MaxLength(100)]
        public string GToken { get; set; }



        public virtual ICollection<DbM_Operation> Operations { get; set; }
        
        public virtual ICollection<DbM_BrokerAcc> Accounts { get; set; }

        public virtual ICollection<DbM_OperationTag> OperationsTags { get; set; }

        public virtual ICollection<B3SignificantPoint> B3SigPoints { get; set; }



        public DbM_User()
        {
            Operations = new HashSet<DbM_Operation>();

            OperationsTags = new HashSet<DbM_OperationTag>();
            Accounts = new HashSet<DbM_BrokerAcc>();
        }
    }

}
