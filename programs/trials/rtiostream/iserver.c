/*
 * iserver.c
 *   �N���C�A���g����̐ڑ��v�����󂯕t����T�[�o�[�v���O�����B
 *   
 *   �N���C�A���g���瑗���Ă����������啶���ɕϊ����đ���Ԃ��B
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h>  /* #include < sys/un.h >�̑��� */


#define PORT 8765

main()
{
    int    i;
    int    fd1, fd2;
    struct sockaddr_in    saddr;
    struct sockaddr_in    caddr;
    int    len;
    int    ret;
    char   buf[1024];


    /*
     * �\�P�b�g�����B���̃\�P�b�g��UNIX�h���C���ŁA�X�g���[���^�\�P�b�g�B
     */
    if ((fd1 = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
	perror("socket");
	exit(1);
    }

    /* 
     * saddr�̒��g��0�ɂ��Ă����Ȃ��ƁAbind()�ŃG���[���N���邱�Ƃ�����
     */
    bzero((char *)&saddr, sizeof(saddr));

    /*
     * �\�P�b�g�̖��O�����Ă���
     */
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = INADDR_ANY;
    saddr.sin_port = htons(PORT);

    /*
     * �\�P�b�g�ɃA�h���X���o�C���h����B
     */
    if (bind(fd1, (struct sockaddr *)&saddr, sizeof(saddr)) < 0){
	perror("bind");
	exit(1);
    }
    
    /*
     * listen���\�P�b�g�ɑ΂��Ĕ��s����
     */
    if (listen(fd1, 1) < 0) {
	perror("listen");
	exit(1);
    }

    len = sizeof(caddr);
    /*
     * accept()�ɂ��A�N���C�A���g����̐ڑ��v�����󂯕t����B
     * ��������ƁA�N���C�A���g�Ɛڑ����ꂽ�\�P�b�g�̃f�B�X�N���v�^��
     * fd2�ɕԂ����B����fd2��ʂ��ĒʐM���\�ƂȂ�B
     * fd1�͕K�v�Ȃ��Ȃ�̂ŁAclose()�ŕ���B
     */
    if ((fd2 = accept(fd1, (struct sockaddr *)&caddr, &len)) < 0) {
	perror("accept");
	exit(1);
    }
    close(fd1);

    /* �N���C�A���g�Ɛڑ�����Ă���\�P�b�g����f�[�^���󂯎�� */
    ret = read(fd2, buf, 1024);
    while (strcmp(buf, "quit\n") != 0) {
	/* buf�̒��̏�������啶���ɕϊ����� */
	for (i=0; i< ret; i++) {
	    if (isalpha(buf[i]))
		buf[i] = toupper(buf[i]);
	    }	
	/* �ϊ������f�[�^���N���C�A���g�ɑ���Ԃ� */
	write(fd2, buf, 1024);
	ret = read(fd2, buf, 1024);
    }
    /* �ʐM���I�������\�P�b�g����� */
    close(fd2);
}
