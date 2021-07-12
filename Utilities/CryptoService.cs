﻿using System.Security.Cryptography;
using System.Text;

namespace Utilities
{
    public static class CryptoService
    {
        private const int SALT_BYTE_SIZE = 24;
        private const int HASH_BYTE_SIZE = 24;
        private const int HASING_ITERATIONS_COUNT = 24;

        public static byte[] ComputeHash(string password, byte[] salt, int iterations = HASING_ITERATIONS_COUNT, int hashByteSize = HASH_BYTE_SIZE)
        {
            using (Rfc2898DeriveBytes hashGenerator = new Rfc2898DeriveBytes(password, salt))
            {
                hashGenerator.IterationCount = iterations;
                return hashGenerator.GetBytes(hashByteSize);
            }
        }

        public static byte[] GenerateSalt(int saltByteSize = SALT_BYTE_SIZE)
        {
            using (RNGCryptoServiceProvider saltGenerator = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[saltByteSize];
                saltGenerator.GetBytes(salt);
                return salt;
            }
        }

        public static bool VerifyPassword(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            byte[] computedHash = ComputeHash(password, passwordSalt);
            return AreHashesEqual(computedHash, passwordHash);
        }

        private static bool AreHashesEqual(byte[] firstHash, byte[] secondHash)
        {
            int minHashLenght = firstHash.Length <= secondHash.Length ? firstHash.Length : secondHash.Length;
            var xor = firstHash.Length ^ secondHash.Length;
            for (int i = 0; i < minHashLenght; i++)
            {
                xor |= firstHash[i] ^ secondHash[i];
            }
            return 0 == xor;
        }

        public static string GetMD5(this string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
    }
}