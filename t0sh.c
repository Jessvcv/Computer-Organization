// CSC 2110, Computer Organization
// Tutorial 0: The Raspberry Pi
// by Jessica Tran

// Computes the Permutations between two given numbers

long int perm(long int n, long int k)
{
  long int j;

  if (n < k)
    return 0;

  if (k == 0)
    return 1;

  j = perm(n-1, k-1);
  return n * j;
}
