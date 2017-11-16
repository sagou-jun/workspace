#include<stdio.h>
#include<windows.h>

//�X���b�h�֐�
DWORD WINAPI ThreadFunc(LPVOID arg)
{
	int i;
	for (i = 0; i < 100; i++) {
		printf("ThreadFunc %d\n", i);
		Sleep(50);
	}
	return 0;
}

int main()
{
	HANDLE hThread;
	DWORD dwThreadId;

	//�X���b�h�N��
	hThread = CreateThread(
		NULL, //�Z�L�����e�B����
		0, //�X�^�b�N�T�C�Y
		ThreadFunc, //�X���b�h�֐�
		NULL, //�X���b�h�֐��ɓn������
		0, //�쐬�I�v�V����(0�܂���CREATE_SUSPENDED)
		&dwThreadId);//�X���b�hID

	Sleep(1500);

	//�X���b�h���~
	SuspendThread(hThread);

	Sleep(2000);
	
	//�X���b�h���ĊJ
	ResumeThread(hThread);

	//�X���b�h�̏I����҂�
	WaitForSingleObject(hThread, INFINITE);

	//�X���b�h�̃n���h�������
	CloseHandle(hThread);

	return 0;
}
