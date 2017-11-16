#include<stdio.h>
#include<windows.h>

void printError(const char *message)
{
	LPVOID lpvMessageBuffer;

	FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER|FORMAT_MESSAGE_FROM_SYSTEM,
		NULL,
		GetLastError(),
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
		(LPTSTR)&lpvMessageBuffer,
		0,
		NULL);
	fprintf(stderr, "%s: %s\n", message, lpvMessageBuffer);
	LocalFree(lpvMessageBuffer);
}

HANDLE childProcess = NULL;

int execute(LPTSTR commandLine)
{
	STARTUPINFO si = { sizeof(STARTUPINFO) };
	PROCESS_INFORMATION pi = {};
	if (!CreateProcess(
		NULL,
		commandLine,
		NULL,	//�v���Z�X�̃Z�L�����e�B�[�L�q�q
		NULL,	//�X���b�h�̃Z�L�����e�B�[�L�q�q
		FALSE,	//�n���h�����p�����Ȃ�
		0,	//�쐬�t���O
		NULL,	//���ϐ��͈����p��
		NULL,	//�J�����g�f�B���N�g���[�͓���
		&si,
		&pi)
	) {
		printError("CreateProcess");
		return -1;
	}
	// �q�v���Z�X�N������
	childProcess = pi.hProcess;

	// �s�v�ȃX���b�h�n���h�����N���[�Y����
	if (!CloseHandle(pi.hThread)) {
		printError("CloseHandle(hThread)");
		return -1;
	}

	printf("child processId=%d\n", pi.dwProcessId);

	// �q�v���Z�X�̏I���҂�
	DWORD r = WaitForSingleObject(childProcess, 5000);
	switch(r) {
	case WAIT_FAILED:
		printError("wait result=WAIT_FAILED");
		return -1;
	case WAIT_ABANDONED:
		printf("wait result=WAIT_ABANDONED\n");
		return -1;
	case WAIT_OBJECT_0: //����I��
		printf("wait result=WAIT_OBJECT_0\n");
		break;
	case WAIT_TIMEOUT:
		printf("wait result=WAIT_TIMEOUT\n");
		return -1;
	default:
		printf("wait result=%d\n", r);
		return -1;
	}

	// �q�v���Z�X�̏I���R�[�h���擾
	DWORD exitCode;
	if (!GetExitCodeProcess(childProcess, &exitCode)) {
		printError("GetExitCodeProcess");
		return -1;
	}
	printf("exitCode=%d/%x\n", exitCode, exitCode);

	return exitCode;
}


int main()
{
	printf("main[%d] start\n", GetCurrentProcessId());

	LPTSTR commandLine = TEXT("C:\\Windows\\System32\\cmd.exe /c C:\\cygwin64\\Cygwin.bat");
	int r = execute(commandLine);

	// �q�v���Z�X�̃n���h���̃N���[�Y
	if (childProcess != NULL) {
		if(!CloseHandle(childProcess)) {
			printError("CloseHandle(childProcess)");
		}
	}

	printf("main[%d] end\n", GetCurrentProcessId());
	return r;
}
