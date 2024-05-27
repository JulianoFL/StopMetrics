using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace StopMetrics.Utils
{
    public static class CryptoMethods
    {
        #region Cryptography



        private static Aes GetRijndaelManaged(string Key)
        {
            var keyBytes = new byte[32];
            var secretKeyBytes = Encoding.UTF8.GetBytes(Key);

            Array.Copy(secretKeyBytes, keyBytes, Math.Min(keyBytes.Length, secretKeyBytes.Length));

            Aes Rinj = Aes.Create();

            Rinj.Mode = CipherMode.CBC;
            Rinj.Padding = PaddingMode.PKCS7;
            Rinj.KeySize = 256;
            Rinj.BlockSize = 128;
            Rinj.Key = keyBytes;

            Rinj.GenerateIV();

            return Rinj;
        }
        private static Aes GetRijndaelManaged(string Key, byte[] IV)
        {
            var keyBytes = new byte[32];
            var secretKeyBytes = Encoding.UTF8.GetBytes(Key);

            Array.Copy(secretKeyBytes, keyBytes, Math.Min(keyBytes.Length, secretKeyBytes.Length));

            Aes Rinj = Aes.Create();

            Rinj.Mode = CipherMode.CBC;
            Rinj.Padding = PaddingMode.PKCS7;
            Rinj.KeySize = 256;
            Rinj.BlockSize = 128;
            Rinj.Key = keyBytes;
            Rinj.IV = IV;

            return Rinj;
        }

        /// <summary>
        /// Faz a encriptação da mensagem no modo AES
        /// </summary>
        /// <param name="Message">Texto para encriptação</param>
        /// <param name="Key">Chave para encriptação</param>
        public static string AESEncrypt(string Message, string Key)
        {
            if(string.IsNullOrEmpty(Message))
                return null;

            byte[] MessageBytes = Encoding.UTF8.GetBytes(Message);

            Aes Rinj = GetRijndaelManaged(Key);
            byte[] EncriptedMessage = Rinj.CreateEncryptor().TransformFinalBlock(MessageBytes, 0, MessageBytes.Length);


            byte[] IVBytes = Rinj.IV;
            byte[] CompleteMessage = new byte[EncriptedMessage.Length + IVBytes.Length];

            Array.Copy(EncriptedMessage, 0, CompleteMessage, 0, EncriptedMessage.Length);
            Array.Copy(IVBytes, 0, CompleteMessage, EncriptedMessage.Length, IVBytes.Length);

            return Convert.ToBase64String(CompleteMessage);
        }

        /// <summary>
        /// Decripta a mensagem no modo AES
        /// </summary>
        /// <param name="EncryptedMessage">Mensagem para desencriptação</param>
        /// <param name="Key">Chave para desencriptação</param>
        public static string AESDecrypt(string EncryptedMessage, string Key)
        {
            if(string.IsNullOrEmpty(EncryptedMessage))
                return null;

            byte[] DecoddedData = Convert.FromBase64String(EncryptedMessage);

            byte[] IVBytes = new byte[16];
            byte[] EncriptedBytes = new byte[DecoddedData.Length - 16];

            Array.Copy(DecoddedData, DecoddedData.Length - 16, IVBytes, 0, 16);
            Array.Copy(DecoddedData, 0, EncriptedBytes, 0, DecoddedData.Length - 16);


            byte[] DecriptedMessage = GetRijndaelManaged(Key, IVBytes).CreateDecryptor().TransformFinalBlock(EncriptedBytes, 0, EncriptedBytes.Length);

            return Encoding.UTF8.GetString(DecriptedMessage);
        }

        /// <summary>
        /// Retorna o valor calculado em Sha1 da entrada conforme chave fornecida
        /// </summary>
        public static string GetSha1(string Input, string Key)
        {
            byte[] KeyBytes = Encoding.ASCII.GetBytes(Key);

            HMACSHA1 MySha1 = new HMACSHA1(KeyBytes);
            byte[] BytesArray = Encoding.ASCII.GetBytes(Input);
            MemoryStream Stream = new MemoryStream(BytesArray);
            return MySha1.ComputeHash(Stream).Aggregate("", (s, e) => s + String.Format("{0:x2}", e), s => s);
        }

        public static string GenerateRandomToken(int Length)
        {
            byte[] tokenBuffer = new byte[Length];

            RandomNumberGenerator.Create().GetBytes(tokenBuffer);

            return Convert.ToBase64String(tokenBuffer);
        }

        public static string Generate256WEPKey()
        {
            // Get the number of words and letters per word.
            int NumLetters = 29;
            // Make an array of the letters we will use.
            char[] Letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray();

            // Make a random number generator.
            Random rand = new Random();

            // Make the words.
            // Make a word.
            string word = "";
            for(int j = 1;j <= NumLetters;j++)
            {
                // Pick a random number between 0 and 25
                // to select a letter from the letters array.
                int letter_num = rand.Next(0, Letters.Length - 1);

                // Append the letter.
                word += Letters[letter_num];
            }
            return word;
        }

        #endregion


        #region Hashes

        private const int SaltByteSize = 24;
        private const int HashByteSize = 20; // to match the size of the PBKDF2-HMAC-SHA-1 hash 
        private const int Pbkdf2Iterations = 5000;
        private const int IterationIndex = 0;
        private const int SaltIndex = 1;
        private const int Pbkdf2Index = 2;

        public static string HashPassword(string Password)
        {
            byte[] salt = new byte[SaltByteSize];

            RandomNumberGenerator.Create().GetBytes(salt);

            var hash = GetPbkdf2Bytes(Password, salt, Pbkdf2Iterations, HashByteSize);

            return Convert.ToBase64String(salt) + Convert.ToBase64String(hash);
            //return Pbkdf2Iterations + ":" + Convert.ToBase64String(salt) + ":" + Convert.ToBase64String(hash);
        }

        public static bool ValidatePassword(string Password, string CorrectHash)
        {
            if(string.IsNullOrEmpty(CorrectHash))
                return false;

            byte[] Salt = Convert.FromBase64String(CorrectHash.Substring(0, 32));
            byte[] Hash = Convert.FromBase64String(CorrectHash.Substring(32, CorrectHash.Length - 32));

            var testHash = GetPbkdf2Bytes(Password, Salt, Pbkdf2Iterations, Hash.Length);
            return SlowEquals(Hash, testHash);
        }

        private static bool SlowEquals(byte[] a, byte[] b)
        {
            var diff = (uint)a.Length ^ (uint)b.Length;
            for(int i = 0;i < a.Length && i < b.Length;i++)
            {
                diff |= (uint)(a[i] ^ b[i]);
            }
            return diff == 0;
        }

        private static byte[] GetPbkdf2Bytes(string password, byte[] salt, int iterations, int outputBytes)
        {
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt);
            pbkdf2.IterationCount = iterations;
            return pbkdf2.GetBytes(outputBytes);
        }

        #endregion

    }
}
