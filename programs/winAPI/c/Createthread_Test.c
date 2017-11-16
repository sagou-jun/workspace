#include<stdio.h>
#include<windows.h>

//スレッド関数
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

	//スレッド起動
	hThread = CreateThread(
		NULL, //セキュリティ属性
		0, //スタックサイズ
		ThreadFunc, //スレッド関数
		NULL, //スレッド関数に渡す引数
		0, //作成オプション(0またはCREATE_SUSPENDED)
		&dwThreadId);//スレッドID

	Sleep(1500);

	//スレッドを停止
	SuspendThread(hThread);

	Sleep(2000);
	
	//スレッドを再開
	ResumeThread(hThread);

	//スレッドの終了を待つ
	WaitForSingleObject(hThread, INFINITE);

	//スレッドのハンドルを閉じる
	CloseHandle(hThread);

	return 0;
}
