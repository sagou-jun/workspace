//#include"std_CForestG3M.h"

#define dim 100

int data(double x);
void QSort(int x[ ], int left, int right);
void Swap(int x[ ], int i, int j);

  /* �N�C�b�N�\�[�g���s�� */
void QSort(int x[ ], int left, int right)
{
    int i, j;
    int pivot;

    i = left;                      /* �\�[�g����z��̈�ԏ������v�f�̓Y�� */
    j = right;                     /* �\�[�g����z��̈�ԑ傫���v�f�̓Y�� */

    pivot = x[(left + right) / 2]; /* ��l��z��̒����t�߂ɂƂ� */

    while (1) {                    /* �������[�v */

        while (x[i] < pivot)       /* pivot ���傫���l�� */
            i++;                   /* �o��܂� i �𑝉������� */

        while (pivot < x[j])       /* pivot ��菬�����l�� */
            j--;                   /*  �o��܂� j ������������ */
        if (i >= j)                /* i >= j �Ȃ� */
            break;                 /* �������[�v���甲���� */

        Swap(x, i, j);             /* x[i] �� x[j]������ */
        i++;                       /* ���̃f�[�^ */
        j--;
    }

    if (left < i - 1)              /* ��l�̍��� 2 �ȏ�v�f������� */
        QSort(x, left, i - 1);     /* ���̔z��� Q �\�[�g���� */
    if (j + 1 <  right)            /* ��l�̉E�� 2 �ȏ�v�f������� */
        QSort(x, j + 1, right);    /* �E�̔z��� Q �\�[�g���� */
}

  /* �z��̗v�f���������� */
void Swap(int x[ ], int i, int j)
{
    int temp;

    temp = x[i];
    x[i] = x[j];
    x[j] = temp;
}


int main(void)
{
  /* �\�[�g����z�� */
  int target[dim];
  int i;
  for(i = 0;i < dim;i++)
    {
      target[i] = data(i);
    }
  QSort(target, 0, dim - 1);
  return 0;
}

int data(double x){
  return (x*x*((int)x%13))/(x*x+1000)*100+x;
}
