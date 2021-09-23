	.file	"protocol.c"
	.text
.Ltext0:
	.globl	pkt_free
	.type	pkt_free, @function
pkt_free:
.LFB66:
	.file 1 "src/proto/protocol.c"
	.loc 1 55 0
	.cfi_startproc
.LVL0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.loc 1 56 0
	movq	16(%rdi), %rdi
.LVL1:
	call	free@PLT
.LVL2:
	.loc 1 57 0
	movq	%rbx, %rdi
	call	free@PLT
.LVL3:
	.loc 1 58 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL4:
	ret
	.cfi_endproc
.LFE66:
	.size	pkt_free, .-pkt_free
	.globl	pkt_init
	.type	pkt_init, @function
pkt_init:
.LFB67:
	.loc 1 61 0
	.cfi_startproc
.LVL5:
	.loc 1 63 0
	movb	%sil, 8(%rdi)
	.loc 1 64 0
	movl	$0, 4(%rdi)
	ret
	.cfi_endproc
.LFE67:
	.size	pkt_init, .-pkt_init
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"%s: invalid packet size (size = 0)"
	.text
	.globl	pkt_new
	.type	pkt_new, @function
pkt_new:
.LFB65:
	.loc 1 37 0
	.cfi_startproc
.LVL6:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 40 0
	testl	%edi, %edi
	jne	.L5
	.loc 1 41 0
	movl	$0, %eax
	call	log_level@PLT
.LVL7:
	.loc 1 42 0
	movl	$0, %ebx
	.loc 1 41 0
	testb	$1, %al
	je	.L6
.LVL8:
	.loc 1 41 0 is_stmt 0 discriminator 1
	movq	stderr@GOTPCREL(%rip), %rbx
.LVL9:
.LBB26:
.LBB27:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 97 0 is_stmt 1 discriminator 1
	leaq	__func__.4523(%rip), %rcx
	leaq	.LC0(%rip), %rdx
	movl	$1, %esi
	movq	(%rbx), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL10:
.LBE27:
.LBE26:
.LBB28:
.LBB29:
	movq	(%rbx), %rsi
	movl	$10, %edi
	call	fputc@PLT
.LVL11:
.LBE29:
.LBE28:
	.loc 1 42 0 discriminator 1
	movl	$0, %ebx
	jmp	.L6
.LVL12:
.L5:
	movl	%edi, %ebp
	movl	%esi, %r12d
	.loc 1 46 0
	movl	$24, %edi
.LVL13:
	call	malloc@PLT
.LVL14:
	movq	%rax, %rbx
.LVL15:
	.loc 1 47 0
	movl	%ebp, %edi
	call	malloc@PLT
.LVL16:
	movq	%rax, 16(%rbx)
	.loc 1 48 0
	movl	%ebp, (%rbx)
	.loc 1 51 0
	movzbl	%r12b, %esi
	movq	%rbx, %rdi
	call	pkt_init@PLT
.LVL17:
.L6:
	.loc 1 53 0
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	pkt_new, .-pkt_new
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"%s: failed to allocate packet buffer (size = %u)"
	.text
	.globl	pkt_reserve
	.type	pkt_reserve, @function
pkt_reserve:
.LFB68:
	.loc 1 68 0
	.cfi_startproc
.LVL18:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.loc 1 69 0
	cmpl	%esi, (%rdi)
	jnb	.L10
	movl	%esi, %ebp
	.loc 1 70 0
	leal	32(%rsi), %esi
.LVL19:
	movl	%esi, (%rdi)
	.loc 1 71 0
	movl	%esi, %esi
	movq	16(%rdi), %rdi
.LVL20:
	call	realloc@PLT
.LVL21:
	movq	%rax, 16(%rbx)
	testq	%rax, %rax
	jne	.L10
	.loc 1 72 0
	call	log_level@PLT
.LVL22:
	testb	$1, %al
	je	.L11
.LVL23:
	.loc 1 72 0 is_stmt 0 discriminator 1
	movq	stderr@GOTPCREL(%rip), %r12
.LVL24:
.LBB30:
.LBB31:
	.loc 2 97 0 is_stmt 1 discriminator 1
	movl	%ebp, %r8d
	leaq	__func__.4536(%rip), %rcx
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movq	(%r12), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL25:
.LBE31:
.LBE30:
.LBB32:
.LBB33:
	movq	(%r12), %rsi
	movl	$10, %edi
	call	fputc@PLT
.LVL26:
.L11:
.LBE33:
.LBE32:
	.loc 1 73 0
	movl	$0, (%rbx)
.LVL27:
.L10:
	.loc 1 77 0
	cmpq	$0, 16(%rbx)
	setne	%al
	movzbl	%al, %eax
	.loc 1 78 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL28:
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	pkt_reserve, .-pkt_reserve
	.globl	pkt_shared
	.type	pkt_shared, @function
pkt_shared:
.LFB69:
	.loc 1 80 0
	.cfi_startproc
	.loc 1 82 0
	movq	sPacket(%rip), %rax
	ret
	.cfi_endproc
.LFE69:
	.size	pkt_shared, .-pkt_shared
	.globl	pkt_claim
	.type	pkt_claim, @function
pkt_claim:
.LFB70:
	.loc 1 84 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 87 0
	leaq	__mutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
.LVL29:
	.loc 1 90 0
	cmpq	$0, sPacket(%rip)
	jne	.L15
	.loc 1 91 0
	movl	$0, %esi
	movl	$32, %edi
	call	pkt_new@PLT
.LVL30:
	movq	%rax, sPacket(%rip)
.L15:
	.loc 1 94 0
	movl	$0, %eax
	call	pkt_shared@PLT
.LVL31:
	.loc 1 95 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE70:
	.size	pkt_claim, .-pkt_claim
	.globl	pkt_release
	.type	pkt_release, @function
pkt_release:
.LFB71:
	.loc 1 97 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 100 0
	leaq	__mutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.LVL32:
	.loc 1 101 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE71:
	.size	pkt_release, .-pkt_release
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"%s: failed to receive packet header"
	.align 8
.LC3:
	.string	"%s: failed to receive packet payload"
	.text
	.globl	pkt_recv
	.type	pkt_recv, @function
pkt_recv:
.LFB72:
	.loc 1 104 0
	.cfi_startproc
.LVL33:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %r12d
	movq	%rsi, %rbx
.LVL34:
	.loc 1 107 0
	movl	$0, 4(%rsi)
	.loc 1 110 0
	movl	$6, %esi
.LVL35:
	movq	%rbx, %rdi
.LVL36:
	call	pkt_reserve@PLT
.LVL37:
	.loc 1 111 0
	movl	$0, %ebp
	.loc 1 110 0
	testl	%eax, %eax
	je	.L20
	.loc 1 113 0
	movq	16(%rbx), %rsi
	movl	%r12d, %edi
	call	pkt_recv_header@PLT
.LVL38:
	testl	%eax, %eax
	jne	.L21
	.loc 1 114 0
	call	log_level@PLT
.LVL39:
	testb	$1, %al
	je	.L20
.LVL40:
	.loc 1 114 0 is_stmt 0 discriminator 1
	movq	stderr@GOTPCREL(%rip), %rbx
.LVL41:
.LBB34:
.LBB35:
	.loc 2 97 0 is_stmt 1 discriminator 1
	leaq	__func__.4548(%rip), %rcx
	leaq	.LC2(%rip), %rdx
	movl	$1, %esi
	movq	(%rbx), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL42:
.LBE35:
.LBE34:
.LBB36:
.LBB37:
	movq	(%rbx), %rsi
	movl	$10, %edi
	call	fputc@PLT
.LVL43:
	jmp	.L20
.LVL44:
.L21:
.LBE37:
.LBE36:
	.loc 1 119 0
	movl	$0, 4(%rbx)
	.loc 1 120 0
	movq	16(%rbx), %rdi
	movzbl	(%rdi), %eax
.LVL45:
	movb	%al, 8(%rbx)
	.loc 1 121 0
	leaq	4(%rbx), %rsi
	addq	$1, %rdi
	call	unpack_size@PLT
.LVL46:
	.loc 1 124 0
	movl	4(%rbx), %esi
	testl	%esi, %esi
	je	.L22
	.loc 1 127 0
	movq	%rbx, %rdi
	call	pkt_reserve@PLT
.LVL47:
	.loc 1 128 0
	movl	$0, %ebp
	.loc 1 127 0
	testl	%eax, %eax
	je	.L20
	.loc 1 130 0
	movl	4(%rbx), %edx
	movq	16(%rbx), %rsi
	movl	%r12d, %edi
	call	recv_full@PLT
.LVL48:
	movl	%eax, %ebp
	movl	%eax, 4(%rbx)
	testl	%eax, %eax
	jne	.L22
	.loc 1 131 0
	movl	$0, %eax
	call	log_level@PLT
.LVL49:
	testb	$1, %al
	je	.L20
.LVL50:
	.loc 1 131 0 is_stmt 0 discriminator 1
	movq	stderr@GOTPCREL(%rip), %rbx
.LVL51:
.LBB38:
.LBB39:
	.loc 2 97 0 is_stmt 1 discriminator 1
	leaq	__func__.4548(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	movl	$1, %esi
	movq	(%rbx), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
.LVL52:
.LBE39:
.LBE38:
.LBB40:
.LBB41:
	movq	(%rbx), %rsi
	movl	$10, %edi
	call	fputc@PLT
.LVL53:
	jmp	.L20
.LVL54:
.L22:
.LBE41:
.LBE40:
	.loc 1 141 0
	movl	4(%rbx), %ebp
.LVL55:
.L20:
	.loc 1 142 0
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL56:
	ret
	.cfi_endproc
.LFE72:
	.size	pkt_recv, .-pkt_recv
	.globl	pkt_send
	.type	pkt_send, @function
pkt_send:
.LFB73:
	.loc 1 145 0
	.cfi_startproc
.LVL57:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbx
	movl	%esi, %r12d
	.loc 1 145 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 151 0
	movl	$0, (%rsp)
	movw	$0, 4(%rsp)
	movzbl	8(%rdi), %eax
	movb	%al, (%rsp)
	.loc 1 152 0
	movl	$0, %ecx
	movl	$1, %edx
	movq	%rsp, %rsi
.LVL58:
	movl	%r12d, %edi
.LVL59:
	call	send@PLT
.LVL60:
	.loc 1 155 0
	movl	4(%rbx), %edi
	movq	%rsp, %rsi
	call	pack_size@PLT
.LVL61:
	.loc 1 156 0
	movslq	%eax, %rdx
	movl	$0, %ecx
	movq	%rsp, %rsi
	movl	%r12d, %edi
	call	send@PLT
.LVL62:
	.loc 1 159 0
	movl	4(%rbx), %edx
	.loc 1 162 0
	movl	$0, %eax
	.loc 1 159 0
	testl	%edx, %edx
	je	.L28
	.loc 1 160 0
	movl	%edx, %edx
	movq	16(%rbx), %rsi
	movl	$0, %ecx
	movl	%r12d, %edi
	call	send@PLT
.LVL63:
.L28:
	.loc 1 163 0
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L29
	call	__stack_chk_fail@PLT
.LVL64:
.L29:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL65:
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL66:
	ret
	.cfi_endproc
.LFE73:
	.size	pkt_send, .-pkt_send
	.globl	pkt_append
	.type	pkt_append, @function
pkt_append:
.LFB74:
	.loc 1 166 0
	.cfi_startproc
.LVL67:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, %rbx
	movl	%esi, %r14d
	movl	%edx, %ebp
	movq	%rcx, 8(%rsp)
	.loc 1 168 0
	leal	4(%rdx), %r12d
.LVL68:
	.loc 1 169 0
	movzwl	%r12w, %r13d
	movl	%r13d, %esi
.LVL69:
	addl	4(%rdi), %esi
	call	pkt_reserve@PLT
.LVL70:
	testl	%eax, %eax
	je	.L33
	.loc 1 172 0
	movl	4(%rbx), %edi
	addq	16(%rbx), %rdi
.LVL71:
	.loc 1 175 0
	movb	%r14b, (%rdi)
.LVL72:
	.loc 1 176 0
	movb	$-126, 1(%rdi)
.LVL73:
.LBB42:
	.loc 1 177 0
	movl	%ebp, %eax
#APP
# 177 "src/proto/protocol.c" 1
	rorw $8, %ax
# 0 "" 2
.LVL74:
#NO_APP
.LBE42:
.LBB43:
.LBB44:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/string3.h"
	.loc 3 53 0
	movw	%ax, 2(%rdi)
.LVL75:
.LBE44:
.LBE43:
	.loc 1 179 0
	testw	%bp, %bp
	je	.L34
.LVL76:
.LBB45:
.LBB46:
	.loc 3 53 0
	addq	$4, %rdi
.LVL77:
	movzwl	%bp, %edx
.LVL78:
	movq	8(%rsp), %rsi
	call	memcpy@PLT
.LVL79:
.L34:
.LBE46:
.LBE45:
	.loc 1 184 0
	addl	%r13d, 4(%rbx)
	.loc 1 185 0
	movzwl	%r12w, %eax
.LVL80:
.L33:
	.loc 1 186 0
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL81:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL82:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL83:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE74:
	.size	pkt_append, .-pkt_append
	.globl	pkt_addnumeric
	.type	pkt_addnumeric, @function
pkt_addnumeric:
.LFB75:
	.loc 1 189 0
	.cfi_startproc
.LVL84:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	%edx, %ebx
	.loc 1 189 0
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	.loc 1 192 0
	movb	%cl, 21(%rsp)
.LVL85:
.LBB47:
	.loc 1 193 0
	movl	%ecx, %eax
#APP
# 193 "src/proto/protocol.c" 1
	rorw $8, %ax
# 0 "" 2
.LVL86:
#NO_APP
.LBE47:
	.loc 1 193 0
	movw	%ax, 22(%rsp)
.LVL87:
.LBB48:
.LBB49:
	.file 4 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.loc 4 47 0
	bswap	%ecx
.LVL88:
.LBE49:
.LBE48:
	.loc 1 194 0
	movl	%ecx, 12(%rsp)
	.loc 1 197 0
	cmpw	$2, %dx
	je	.L38
	cmpw	$4, %dx
	je	.L39
	.loc 1 202 0
	movl	$0, %eax
.LVL89:
	.loc 1 197 0
	cmpw	$1, %dx
	jne	.L37
	.loc 1 198 0
	leaq	21(%rsp), %rcx
	movzbl	%sil, %esi
	movl	$1, %edx
.LVL90:
	call	pkt_append@PLT
.LVL91:
	jmp	.L41
.LVL92:
.L38:
	.loc 1 199 0
	leaq	22(%rsp), %rcx
	movzbl	%sil, %esi
	movl	$2, %edx
.LVL93:
	call	pkt_append@PLT
.LVL94:
	jmp	.L41
.LVL95:
.L39:
	.loc 1 200 0
	leaq	12(%rsp), %rcx
	movzbl	%sil, %esi
	movl	$4, %edx
.LVL96:
	call	pkt_append@PLT
.LVL97:
.L41:
	.loc 1 206 0
	movzwl	%bx, %eax
	jmp	.L37
.L37:
	.loc 1 207 0
	movq	24(%rsp), %rdx
	xorq	%fs:40, %rdx
	je	.L42
	call	__stack_chk_fail@PLT
.LVL98:
.L42:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE75:
	.size	pkt_addnumeric, .-pkt_addnumeric
	.globl	iter_end
	.type	iter_end, @function
iter_end:
.LFB77:
	.loc 1 225 0
	.cfi_startproc
.LVL99:
	.loc 1 226 0
	movq	16(%rdi), %rax
	cmpq	%rax, (%rdi)
	setnb	%al
	movzbl	%al, %eax
	.loc 1 227 0
	ret
	.cfi_endproc
.LFE77:
	.size	iter_end, .-iter_end
	.globl	iter_next
	.type	iter_next, @function
iter_next:
.LFB78:
	.loc 1 230 0
	.cfi_startproc
.LVL100:
	.loc 1 232 0
	movb	$0, 24(%rdi)
	.loc 1 233 0
	movl	$0, 28(%rdi)
	.loc 1 236 0
	movq	8(%rdi), %rax
	cmpq	16(%rdi), %rax
	jb	.L48
	.loc 1 237 0
	movq	%rax, (%rdi)
	.loc 1 238 0
	movl	$0, %eax
	.loc 1 259 0
	ret
.L48:
	.loc 1 230 0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	.loc 1 242 0
	movq	%rax, (%rdi)
.LVL101:
	.loc 1 244 0
	movzbl	(%rax), %edx
	movb	%dl, 24(%rdi)
	.loc 1 245 0
	leaq	1(%rax), %rbp
.LVL102:
	.loc 1 249 0
	leaq	28(%rdi), %rsi
	movq	%rbp, %rdi
.LVL103:
	call	unpack_size@PLT
.LVL104:
	cltq
	addq	%rbp, %rax
.LVL105:
	.loc 1 252 0
	movq	%rax, 32(%rbx)
	.loc 1 255 0
	movl	28(%rbx), %ebp
	addq	%rbp, %rax
.LVL106:
	movq	%rax, 8(%rbx)
	.loc 1 258 0
	movq	(%rbx), %rax
	.loc 1 259 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL107:
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE78:
	.size	iter_next, .-iter_next
	.globl	pkt_begin
	.type	pkt_begin, @function
pkt_begin:
.LFB76:
	.loc 1 210 0
	.cfi_startproc
.LVL108:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rbx
	.loc 1 212 0
	movb	$0, 24(%rsi)
	.loc 1 213 0
	movl	$0, 28(%rsi)
	.loc 1 214 0
	movq	$0, 16(%rsi)
	movq	$0, 8(%rsi)
	movq	$0, (%rsi)
	.loc 1 217 0
	movq	16(%rdi), %rdx
	movq	%rdx, 8(%rsi)
	.loc 1 218 0
	movl	4(%rdi), %eax
	addq	%rdx, %rax
	movq	%rax, 16(%rsi)
	.loc 1 219 0
	movq	%rsi, %rdi
.LVL109:
	call	iter_next@PLT
.LVL110:
	.loc 1 221 0
	movq	(%rbx), %rax
	.loc 1 222 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL111:
	ret
	.cfi_endproc
.LFE76:
	.size	pkt_begin, .-pkt_begin
	.globl	iter_nextval
	.type	iter_nextval, @function
iter_nextval:
.LFB79:
	.loc 1 262 0
	.cfi_startproc
.LVL112:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 263 0
	movq	32(%rdi), %rbx
.LVL113:
	.loc 1 264 0
	call	iter_next@PLT
.LVL114:
	.loc 1 266 0
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL115:
	ret
	.cfi_endproc
.LFE79:
	.size	iter_nextval, .-iter_nextval
	.globl	iter_enter
	.type	iter_enter, @function
iter_enter:
.LFB80:
	.loc 1 269 0
	.cfi_startproc
.LVL116:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	.loc 1 269 0
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	.loc 1 272 0
	leaq	4(%rsp), %rsi
	movq	(%rdi), %rax
	leaq	1(%rax), %rdi
.LVL117:
	call	unpack_size@PLT
.LVL118:
	.loc 1 275 0
	cltq
	movq	(%rbx), %rdx
	leaq	1(%rdx,%rax), %rax
.LVL119:
	movq	%rax, 8(%rbx)
	.loc 1 276 0
	movq	%rbx, %rdi
	call	iter_next@PLT
.LVL120:
	.loc 1 277 0
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L56
	call	__stack_chk_fail@PLT
.LVL121:
.L56:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL122:
	ret
	.cfi_endproc
.LFE80:
	.size	iter_enter, .-iter_enter
	.section	.rodata
	.align 8
	.type	__func__.4548, @object
	.size	__func__.4548, 9
__func__.4548:
	.string	"pkt_recv"
	.align 8
	.type	__func__.4536, @object
	.size	__func__.4536, 12
__func__.4536:
	.string	"pkt_reserve"
	.align 8
	.type	__func__.4523, @object
	.size	__func__.4523, 8
__func__.4523:
	.string	"pkt_new"
	.local	sPacket
	.comm	sPacket,8,8
	.local	__mutex
	.comm	__mutex,40,32
	.text
.Letext0:
	.file 5 "/usr/include/stdint.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 7 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/libio.h"
	.file 11 "src/proto/protocol.h"
	.file 12 "/usr/include/stdlib.h"
	.file 13 "./src/shared/common.h"
	.file 14 "/usr/include/pthread.h"
	.file 15 "src/proto/protobase.h"
	.file 16 "/usr/include/x86_64-linux-gnu/sys/socket.h"
	.file 17 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1217
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF139
	.byte	0xc
	.long	.LASF140
	.long	.LASF141
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x5
	.byte	0x26
	.long	0x46
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.long	.LASF4
	.byte	0x5
	.byte	0x30
	.long	0x5f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x5
	.byte	0x31
	.long	0x71
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF8
	.byte	0x5
	.byte	0x33
	.long	0x83
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x3
	.long	.LASF11
	.byte	0x6
	.byte	0x83
	.long	0x4d
	.uleb128 0x3
	.long	.LASF12
	.byte	0x6
	.byte	0x84
	.long	0x4d
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xb6
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x3
	.long	.LASF15
	.byte	0x7
	.byte	0xd8
	.long	0x8a
	.uleb128 0x7
	.long	.LASF19
	.byte	0x10
	.byte	0x8
	.byte	0x4b
	.long	0xed
	.uleb128 0x8
	.long	.LASF16
	.byte	0x8
	.byte	0x4d
	.long	0xed
	.byte	0
	.uleb128 0x8
	.long	.LASF17
	.byte	0x8
	.byte	0x4e
	.long	0xed
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xc8
	.uleb128 0x3
	.long	.LASF18
	.byte	0x8
	.byte	0x4f
	.long	0xc8
	.uleb128 0x7
	.long	.LASF20
	.byte	0x28
	.byte	0x8
	.byte	0x5c
	.long	0x16b
	.uleb128 0x8
	.long	.LASF21
	.byte	0x8
	.byte	0x5e
	.long	0x46
	.byte	0
	.uleb128 0x8
	.long	.LASF22
	.byte	0x8
	.byte	0x5f
	.long	0x83
	.byte	0x4
	.uleb128 0x8
	.long	.LASF23
	.byte	0x8
	.byte	0x60
	.long	0x46
	.byte	0x8
	.uleb128 0x8
	.long	.LASF24
	.byte	0x8
	.byte	0x62
	.long	0x83
	.byte	0xc
	.uleb128 0x8
	.long	.LASF25
	.byte	0x8
	.byte	0x66
	.long	0x46
	.byte	0x10
	.uleb128 0x8
	.long	.LASF26
	.byte	0x8
	.byte	0x68
	.long	0x34
	.byte	0x14
	.uleb128 0x8
	.long	.LASF27
	.byte	0x8
	.byte	0x69
	.long	0x34
	.byte	0x16
	.uleb128 0x8
	.long	.LASF28
	.byte	0x8
	.byte	0x6a
	.long	0xf3
	.byte	0x18
	.byte	0
	.uleb128 0x9
	.byte	0x28
	.byte	0x8
	.byte	0x5a
	.long	0x195
	.uleb128 0xa
	.long	.LASF29
	.byte	0x8
	.byte	0x7d
	.long	0xfe
	.uleb128 0xa
	.long	.LASF30
	.byte	0x8
	.byte	0x7e
	.long	0x195
	.uleb128 0xa
	.long	.LASF31
	.byte	0x8
	.byte	0x7f
	.long	0x4d
	.byte	0
	.uleb128 0xb
	.long	0xb6
	.long	0x1a5
	.uleb128 0xc
	.long	0xa7
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.long	.LASF32
	.byte	0x8
	.byte	0x80
	.long	0x16b
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF33
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF34
	.uleb128 0x6
	.byte	0x8
	.long	0x1c4
	.uleb128 0xd
	.long	0xb6
	.uleb128 0x3
	.long	.LASF35
	.byte	0x9
	.byte	0x30
	.long	0x1d4
	.uleb128 0x7
	.long	.LASF36
	.byte	0xd8
	.byte	0xa
	.byte	0xf1
	.long	0x351
	.uleb128 0x8
	.long	.LASF37
	.byte	0xa
	.byte	0xf2
	.long	0x46
	.byte	0
	.uleb128 0x8
	.long	.LASF38
	.byte	0xa
	.byte	0xf7
	.long	0xb0
	.byte	0x8
	.uleb128 0x8
	.long	.LASF39
	.byte	0xa
	.byte	0xf8
	.long	0xb0
	.byte	0x10
	.uleb128 0x8
	.long	.LASF40
	.byte	0xa
	.byte	0xf9
	.long	0xb0
	.byte	0x18
	.uleb128 0x8
	.long	.LASF41
	.byte	0xa
	.byte	0xfa
	.long	0xb0
	.byte	0x20
	.uleb128 0x8
	.long	.LASF42
	.byte	0xa
	.byte	0xfb
	.long	0xb0
	.byte	0x28
	.uleb128 0x8
	.long	.LASF43
	.byte	0xa
	.byte	0xfc
	.long	0xb0
	.byte	0x30
	.uleb128 0x8
	.long	.LASF44
	.byte	0xa
	.byte	0xfd
	.long	0xb0
	.byte	0x38
	.uleb128 0x8
	.long	.LASF45
	.byte	0xa
	.byte	0xfe
	.long	0xb0
	.byte	0x40
	.uleb128 0xe
	.long	.LASF46
	.byte	0xa
	.value	0x100
	.long	0xb0
	.byte	0x48
	.uleb128 0xe
	.long	.LASF47
	.byte	0xa
	.value	0x101
	.long	0xb0
	.byte	0x50
	.uleb128 0xe
	.long	.LASF48
	.byte	0xa
	.value	0x102
	.long	0xb0
	.byte	0x58
	.uleb128 0xe
	.long	.LASF49
	.byte	0xa
	.value	0x104
	.long	0x389
	.byte	0x60
	.uleb128 0xe
	.long	.LASF50
	.byte	0xa
	.value	0x106
	.long	0x38f
	.byte	0x68
	.uleb128 0xe
	.long	.LASF51
	.byte	0xa
	.value	0x108
	.long	0x46
	.byte	0x70
	.uleb128 0xe
	.long	.LASF52
	.byte	0xa
	.value	0x10c
	.long	0x46
	.byte	0x74
	.uleb128 0xe
	.long	.LASF53
	.byte	0xa
	.value	0x10e
	.long	0x91
	.byte	0x78
	.uleb128 0xe
	.long	.LASF54
	.byte	0xa
	.value	0x112
	.long	0x71
	.byte	0x80
	.uleb128 0xe
	.long	.LASF55
	.byte	0xa
	.value	0x113
	.long	0x2d
	.byte	0x82
	.uleb128 0xe
	.long	.LASF56
	.byte	0xa
	.value	0x114
	.long	0x395
	.byte	0x83
	.uleb128 0xe
	.long	.LASF57
	.byte	0xa
	.value	0x118
	.long	0x3a5
	.byte	0x88
	.uleb128 0xe
	.long	.LASF58
	.byte	0xa
	.value	0x121
	.long	0x9c
	.byte	0x90
	.uleb128 0xe
	.long	.LASF59
	.byte	0xa
	.value	0x129
	.long	0xae
	.byte	0x98
	.uleb128 0xe
	.long	.LASF60
	.byte	0xa
	.value	0x12a
	.long	0xae
	.byte	0xa0
	.uleb128 0xe
	.long	.LASF61
	.byte	0xa
	.value	0x12b
	.long	0xae
	.byte	0xa8
	.uleb128 0xe
	.long	.LASF62
	.byte	0xa
	.value	0x12c
	.long	0xae
	.byte	0xb0
	.uleb128 0xe
	.long	.LASF63
	.byte	0xa
	.value	0x12e
	.long	0xbd
	.byte	0xb8
	.uleb128 0xe
	.long	.LASF64
	.byte	0xa
	.value	0x12f
	.long	0x46
	.byte	0xc0
	.uleb128 0xe
	.long	.LASF65
	.byte	0xa
	.value	0x131
	.long	0x3ab
	.byte	0xc4
	.byte	0
	.uleb128 0xf
	.long	.LASF142
	.byte	0xa
	.byte	0x96
	.uleb128 0x7
	.long	.LASF66
	.byte	0x18
	.byte	0xa
	.byte	0x9c
	.long	0x389
	.uleb128 0x8
	.long	.LASF67
	.byte	0xa
	.byte	0x9d
	.long	0x389
	.byte	0
	.uleb128 0x8
	.long	.LASF68
	.byte	0xa
	.byte	0x9e
	.long	0x38f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF69
	.byte	0xa
	.byte	0xa2
	.long	0x46
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x358
	.uleb128 0x6
	.byte	0x8
	.long	0x1d4
	.uleb128 0xb
	.long	0xb6
	.long	0x3a5
	.uleb128 0xc
	.long	0xa7
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x351
	.uleb128 0xb
	.long	0xb6
	.long	0x3bb
	.uleb128 0xc
	.long	0xa7
	.byte	0x13
	.byte	0
	.uleb128 0x10
	.long	.LASF143
	.byte	0x4
	.long	0x83
	.byte	0xd
	.byte	0x1f
	.long	0x3e4
	.uleb128 0x11
	.long	.LASF70
	.byte	0
	.uleb128 0x11
	.long	.LASF71
	.byte	0x1
	.uleb128 0x11
	.long	.LASF72
	.byte	0x2
	.uleb128 0x11
	.long	.LASF73
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.long	0x83
	.byte	0xf
	.byte	0x22
	.long	0x439
	.uleb128 0x11
	.long	.LASF74
	.byte	0
	.uleb128 0x11
	.long	.LASF75
	.byte	0x1
	.uleb128 0x11
	.long	.LASF76
	.byte	0x2
	.uleb128 0x11
	.long	.LASF77
	.byte	0x3
	.uleb128 0x11
	.long	.LASF78
	.byte	0x5
	.uleb128 0x11
	.long	.LASF79
	.byte	0x4
	.uleb128 0x11
	.long	.LASF80
	.byte	0x10
	.uleb128 0x11
	.long	.LASF81
	.byte	0xa
	.uleb128 0x11
	.long	.LASF82
	.byte	0x11
	.uleb128 0x11
	.long	.LASF83
	.byte	0x20
	.uleb128 0x11
	.long	.LASF84
	.byte	0x21
	.uleb128 0x11
	.long	.LASF85
	.byte	0x30
	.byte	0
	.uleb128 0x13
	.byte	0x18
	.byte	0xb
	.byte	0x3c
	.long	0x471
	.uleb128 0x8
	.long	.LASF86
	.byte	0xb
	.byte	0x3d
	.long	0x78
	.byte	0
	.uleb128 0x8
	.long	.LASF87
	.byte	0xb
	.byte	0x3e
	.long	0x78
	.byte	0x4
	.uleb128 0x14
	.string	"op"
	.byte	0xb
	.byte	0x3f
	.long	0x54
	.byte	0x8
	.uleb128 0x14
	.string	"buf"
	.byte	0xb
	.byte	0x40
	.long	0xb0
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF88
	.byte	0xb
	.byte	0x41
	.long	0x439
	.uleb128 0x13
	.byte	0x28
	.byte	0xb
	.byte	0x44
	.long	0x4cd
	.uleb128 0x14
	.string	"cur"
	.byte	0xb
	.byte	0x45
	.long	0xae
	.byte	0
	.uleb128 0x8
	.long	.LASF89
	.byte	0xb
	.byte	0x45
	.long	0xae
	.byte	0x8
	.uleb128 0x14
	.string	"end"
	.byte	0xb
	.byte	0x45
	.long	0xae
	.byte	0x10
	.uleb128 0x8
	.long	.LASF90
	.byte	0xb
	.byte	0x46
	.long	0x54
	.byte	0x18
	.uleb128 0x14
	.string	"len"
	.byte	0xb
	.byte	0x47
	.long	0x78
	.byte	0x1c
	.uleb128 0x14
	.string	"val"
	.byte	0xb
	.byte	0x48
	.long	0xae
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.long	.LASF91
	.byte	0xb
	.byte	0x49
	.long	0x47c
	.uleb128 0x6
	.byte	0x8
	.long	0x4de
	.uleb128 0x15
	.uleb128 0x16
	.long	.LASF94
	.byte	0x2
	.byte	0x5f
	.long	0x46
	.byte	0x3
	.long	0x507
	.uleb128 0x17
	.long	.LASF92
	.byte	0x2
	.byte	0x5f
	.long	0x50d
	.uleb128 0x17
	.long	.LASF93
	.byte	0x2
	.byte	0x5f
	.long	0x512
	.uleb128 0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1c9
	.uleb128 0x19
	.long	0x507
	.uleb128 0x19
	.long	0x1be
	.uleb128 0x16
	.long	.LASF95
	.byte	0x3
	.byte	0x32
	.long	0xae
	.byte	0x3
	.long	0x549
	.uleb128 0x17
	.long	.LASF96
	.byte	0x3
	.byte	0x32
	.long	0x549
	.uleb128 0x17
	.long	.LASF97
	.byte	0x3
	.byte	0x32
	.long	0x54e
	.uleb128 0x17
	.long	.LASF98
	.byte	0x3
	.byte	0x32
	.long	0xbd
	.byte	0
	.uleb128 0x19
	.long	0xae
	.uleb128 0x19
	.long	0x4d8
	.uleb128 0x1a
	.long	.LASF144
	.byte	0x4
	.byte	0x2d
	.long	0x83
	.byte	0x3
	.long	0x56f
	.uleb128 0x17
	.long	.LASF99
	.byte	0x4
	.byte	0x2d
	.long	0x83
	.byte	0
	.uleb128 0x1b
	.long	.LASF100
	.byte	0x1
	.byte	0x37
	.quad	.LFB66
	.quad	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.long	0x5bd
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0x37
	.long	0x5bd
	.long	.LLST0
	.uleb128 0x1d
	.quad	.LVL2
	.long	0x116a
	.uleb128 0x1e
	.quad	.LVL3
	.long	0x116a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x471
	.uleb128 0x1b
	.long	.LASF101
	.byte	0x1
	.byte	0x3c
	.quad	.LFB67
	.quad	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.long	0x5fa
	.uleb128 0x20
	.string	"pkt"
	.byte	0x1
	.byte	0x3c
	.long	0x5bd
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x20
	.string	"op"
	.byte	0x1
	.byte	0x3c
	.long	0x54
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x21
	.long	.LASF102
	.byte	0x1
	.byte	0x25
	.long	0x5bd
	.quad	.LFB65
	.quad	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.long	0x756
	.uleb128 0x22
	.long	.LASF87
	.byte	0x1
	.byte	0x25
	.long	0x78
	.long	.LLST1
	.uleb128 0x1c
	.string	"op"
	.byte	0x1
	.byte	0x25
	.long	0x54
	.long	.LLST2
	.uleb128 0x23
	.long	.LASF104
	.long	0x766
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4523
	.uleb128 0x24
	.string	"pkt"
	.byte	0x1
	.byte	0x2e
	.long	0x5bd
	.long	.LLST3
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.byte	0x1
	.byte	0x29
	.long	0x6b5
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST4
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST5
	.uleb128 0x1e
	.quad	.LVL10
	.long	0x1176
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4523
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.byte	0x1
	.byte	0x29
	.long	0x6f6
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST6
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST7
	.uleb128 0x1e
	.quad	.LVL11
	.long	0x1187
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL7
	.long	0x1196
	.uleb128 0x27
	.quad	.LVL14
	.long	0x11a1
	.long	0x71a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.uleb128 0x27
	.quad	.LVL16
	.long	0x11a1
	.long	0x738
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x8
	.byte	0x76
	.sleb128 0
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0
	.uleb128 0x1e
	.quad	.LVL17
	.long	0x5c3
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x1c4
	.long	0x766
	.uleb128 0xc
	.long	0xa7
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	0x756
	.uleb128 0x21
	.long	.LASF103
	.byte	0x1
	.byte	0x43
	.long	0x46
	.quad	.LFB68
	.quad	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.long	0x88b
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0x43
	.long	0x5bd
	.long	.LLST8
	.uleb128 0x22
	.long	.LASF87
	.byte	0x1
	.byte	0x43
	.long	0x78
	.long	.LLST9
	.uleb128 0x23
	.long	.LASF104
	.long	0x89b
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4536
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.byte	0x1
	.byte	0x48
	.long	0x81e
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST10
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST11
	.uleb128 0x1e
	.quad	.LVL25
	.long	0x1176
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4536
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.byte	0x1
	.byte	0x48
	.long	0x85f
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST12
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST13
	.uleb128 0x1e
	.quad	.LVL26
	.long	0x1187
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x27
	.quad	.LVL21
	.long	0x11ad
	.long	0x87d
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x8
	.byte	0x76
	.sleb128 32
	.byte	0xc
	.long	0xffffffff
	.byte	0x1a
	.byte	0
	.uleb128 0x1d
	.quad	.LVL22
	.long	0x1196
	.byte	0
	.uleb128 0xb
	.long	0x1c4
	.long	0x89b
	.uleb128 0xc
	.long	0xa7
	.byte	0xb
	.byte	0
	.uleb128 0xd
	.long	0x88b
	.uleb128 0x28
	.long	.LASF145
	.byte	0x1
	.byte	0x50
	.long	0x5bd
	.quad	.LFB69
	.quad	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x29
	.long	.LASF105
	.byte	0x1
	.byte	0x54
	.long	0x5bd
	.quad	.LFB70
	.quad	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.long	0x928
	.uleb128 0x27
	.quad	.LVL29
	.long	0x11b9
	.long	0x8fd
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	__mutex
	.byte	0
	.uleb128 0x27
	.quad	.LVL30
	.long	0x5fa
	.long	0x91a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL31
	.long	0x8a0
	.byte	0
	.uleb128 0x2a
	.long	.LASF106
	.byte	0x1
	.byte	0x61
	.quad	.LFB71
	.quad	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.long	0x961
	.uleb128 0x1e
	.quad	.LVL32
	.long	0x11c5
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	__mutex
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF107
	.byte	0x1
	.byte	0x67
	.long	0x78
	.quad	.LFB72
	.quad	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.long	0xb91
	.uleb128 0x1c
	.string	"fd"
	.byte	0x1
	.byte	0x67
	.long	0x46
	.long	.LLST14
	.uleb128 0x1c
	.string	"dst"
	.byte	0x1
	.byte	0x67
	.long	0x5bd
	.long	.LLST15
	.uleb128 0x2b
	.long	.LASF87
	.byte	0x1
	.byte	0x6a
	.long	0x78
	.long	.LLST16
	.uleb128 0x23
	.long	.LASF104
	.long	0xba1
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4548
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.byte	0x1
	.byte	0x72
	.long	0xa1c
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST17
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST18
	.uleb128 0x1e
	.quad	.LVL42
	.long	0x1176
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4548
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.byte	0x1
	.byte	0x72
	.long	0xa5d
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST19
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST20
	.uleb128 0x1e
	.quad	.LVL43
	.long	0x1187
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.byte	0x1
	.byte	0x83
	.long	0xab8
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST21
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST22
	.uleb128 0x1e
	.quad	.LVL52
	.long	0x1176
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	__func__.4548
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x4df
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.byte	0x1
	.byte	0x83
	.long	0xaf9
	.uleb128 0x26
	.long	0x4fa
	.long	.LLST23
	.uleb128 0x26
	.long	0x4ef
	.long	.LLST24
	.uleb128 0x1e
	.quad	.LVL53
	.long	0x1187
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x27
	.quad	.LVL37
	.long	0x76b
	.long	0xb16
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.uleb128 0x27
	.quad	.LVL38
	.long	0x11d1
	.long	0xb2e
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL39
	.long	0x1196
	.uleb128 0x27
	.quad	.LVL46
	.long	0x11dc
	.long	0xb53
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 4
	.byte	0
	.uleb128 0x27
	.quad	.LVL47
	.long	0x76b
	.long	0xb6b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL48
	.long	0x11e7
	.long	0xb83
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL49
	.long	0x1196
	.byte	0
	.uleb128 0xb
	.long	0x1c4
	.long	0xba1
	.uleb128 0xc
	.long	0xa7
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.long	0xb91
	.uleb128 0x21
	.long	.LASF108
	.byte	0x1
	.byte	0x90
	.long	0x46
	.quad	.LFB73
	.quad	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.long	0xc8f
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0x90
	.long	0x5bd
	.long	.LLST25
	.uleb128 0x1c
	.string	"fd"
	.byte	0x1
	.byte	0x90
	.long	0x46
	.long	.LLST26
	.uleb128 0x2c
	.string	"buf"
	.byte	0x1
	.byte	0x97
	.long	0xc8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.string	"len"
	.byte	0x1
	.byte	0x9b
	.long	0x46
	.long	.LLST27
	.uleb128 0x27
	.quad	.LVL60
	.long	0x11f2
	.long	0xc29
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.quad	.LVL61
	.long	0x11fd
	.long	0xc41
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL62
	.long	0x11f2
	.long	0xc64
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.quad	.LVL63
	.long	0x11f2
	.long	0xc81
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1d
	.quad	.LVL64
	.long	0x1208
	.byte	0
	.uleb128 0xb
	.long	0xb6
	.long	0xc9f
	.uleb128 0xc
	.long	0xa7
	.byte	0x5
	.byte	0
	.uleb128 0x21
	.long	.LASF109
	.byte	0x1
	.byte	0xa5
	.long	0x46
	.quad	.LFB74
	.quad	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.long	0xe00
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0xa5
	.long	0x5bd
	.long	.LLST28
	.uleb128 0x22
	.long	.LASF90
	.byte	0x1
	.byte	0xa5
	.long	0x54
	.long	.LLST29
	.uleb128 0x1c
	.string	"len"
	.byte	0x1
	.byte	0xa5
	.long	0x66
	.long	.LLST30
	.uleb128 0x1c
	.string	"val"
	.byte	0x1
	.byte	0xa5
	.long	0x4d8
	.long	.LLST31
	.uleb128 0x2b
	.long	.LASF110
	.byte	0x1
	.byte	0xa8
	.long	0x66
	.long	.LLST32
	.uleb128 0x24
	.string	"dst"
	.byte	0x1
	.byte	0xac
	.long	0xb0
	.long	.LLST33
	.uleb128 0x2b
	.long	.LASF111
	.byte	0x1
	.byte	0xb1
	.long	0x66
	.long	.LLST34
	.uleb128 0x2d
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.long	0xd5d
	.uleb128 0x24
	.string	"__v"
	.byte	0x1
	.byte	0xb1
	.long	0x71
	.long	.LLST34
	.uleb128 0x24
	.string	"__x"
	.byte	0x1
	.byte	0xb1
	.long	0x71
	.long	.LLST36
	.byte	0
	.uleb128 0x25
	.long	0x517
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.byte	0x1
	.byte	0xb2
	.long	0xd94
	.uleb128 0x26
	.long	0x53d
	.long	.LLST37
	.uleb128 0x26
	.long	0x532
	.long	.LLST38
	.uleb128 0x26
	.long	0x527
	.long	.LLST39
	.byte	0
	.uleb128 0x25
	.long	0x517
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.byte	0x1
	.byte	0xb4
	.long	0xdeb
	.uleb128 0x26
	.long	0x53d
	.long	.LLST40
	.uleb128 0x26
	.long	0x532
	.long	.LLST41
	.uleb128 0x26
	.long	0x527
	.long	.LLST42
	.uleb128 0x1e
	.quad	.LVL79
	.long	0x1211
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x6
	.byte	0x76
	.sleb128 0
	.byte	0xa
	.value	0xffff
	.byte	0x1a
	.byte	0
	.byte	0
	.uleb128 0x1e
	.quad	.LVL70
	.long	0x76b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF112
	.byte	0x1
	.byte	0xbc
	.long	0x46
	.quad	.LFB75
	.quad	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.long	0xf5c
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0xbc
	.long	0x5bd
	.long	.LLST43
	.uleb128 0x22
	.long	.LASF90
	.byte	0x1
	.byte	0xbc
	.long	0x54
	.long	.LLST44
	.uleb128 0x1c
	.string	"len"
	.byte	0x1
	.byte	0xbc
	.long	0x66
	.long	.LLST45
	.uleb128 0x1c
	.string	"val"
	.byte	0x1
	.byte	0xbc
	.long	0x3b
	.long	.LLST46
	.uleb128 0x2e
	.long	.LASF113
	.byte	0x1
	.byte	0xc0
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x2e
	.long	.LASF114
	.byte	0x1
	.byte	0xc1
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x2d
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.long	0xead
	.uleb128 0x24
	.string	"__v"
	.byte	0x1
	.byte	0xc1
	.long	0x71
	.long	.LLST47
	.uleb128 0x24
	.string	"__x"
	.byte	0x1
	.byte	0xc1
	.long	0x71
	.long	.LLST48
	.byte	0
	.uleb128 0x25
	.long	0x553
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.byte	0x1
	.byte	0xc2
	.long	0xed2
	.uleb128 0x26
	.long	0x563
	.long	.LLST49
	.byte	0
	.uleb128 0x27
	.quad	.LVL91
	.long	0xc9f
	.long	0xf00
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.byte	0
	.uleb128 0x27
	.quad	.LVL94
	.long	0xc9f
	.long	0xf27
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.byte	0
	.uleb128 0x27
	.quad	.LVL97
	.long	0xc9f
	.long	0xf4e
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1d
	.quad	.LVL98
	.long	0x1208
	.byte	0
	.uleb128 0x21
	.long	.LASF115
	.byte	0x1
	.byte	0xe0
	.long	0x46
	.quad	.LFB77
	.quad	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.long	0xf8a
	.uleb128 0x20
	.string	"it"
	.byte	0x1
	.byte	0xe0
	.long	0xf8a
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4cd
	.uleb128 0x21
	.long	.LASF116
	.byte	0x1
	.byte	0xe5
	.long	0xae
	.quad	.LFB78
	.quad	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.long	0xfe7
	.uleb128 0x1c
	.string	"it"
	.byte	0x1
	.byte	0xe5
	.long	0xf8a
	.long	.LLST50
	.uleb128 0x24
	.string	"p"
	.byte	0x1
	.byte	0xf3
	.long	0xb0
	.long	.LLST51
	.uleb128 0x1e
	.quad	.LVL104
	.long	0x11dc
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 28
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF117
	.byte	0x1
	.byte	0xd1
	.long	0xae
	.quad	.LFB76
	.quad	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.long	0x103a
	.uleb128 0x1c
	.string	"pkt"
	.byte	0x1
	.byte	0xd1
	.long	0x5bd
	.long	.LLST52
	.uleb128 0x1c
	.string	"it"
	.byte	0x1
	.byte	0xd1
	.long	0xf8a
	.long	.LLST53
	.uleb128 0x1e
	.quad	.LVL110
	.long	0xf90
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.long	.LASF118
	.byte	0x1
	.value	0x105
	.long	0xae
	.quad	.LFB79
	.quad	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.long	0x1091
	.uleb128 0x30
	.string	"it"
	.byte	0x1
	.value	0x105
	.long	0xf8a
	.long	.LLST54
	.uleb128 0x31
	.string	"val"
	.byte	0x1
	.value	0x107
	.long	0xae
	.long	.LLST55
	.uleb128 0x1e
	.quad	.LVL114
	.long	0xf90
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0x2f
	.long	.LASF119
	.byte	0x1
	.value	0x10c
	.long	0xae
	.quad	.LFB80
	.quad	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.long	0x111f
	.uleb128 0x30
	.string	"it"
	.byte	0x1
	.value	0x10c
	.long	0xf8a
	.long	.LLST56
	.uleb128 0x32
	.long	.LASF120
	.byte	0x1
	.value	0x10f
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x31
	.string	"len"
	.byte	0x1
	.value	0x110
	.long	0x46
	.long	.LLST57
	.uleb128 0x27
	.quad	.LVL118
	.long	0x11dc
	.long	0x10f9
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x27
	.quad	.LVL120
	.long	0xf90
	.long	0x1111
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL121
	.long	0x1208
	.byte	0
	.uleb128 0x2e
	.long	.LASF121
	.byte	0x1
	.byte	0x20
	.long	0x1a5
	.uleb128 0x9
	.byte	0x3
	.quad	__mutex
	.uleb128 0x2e
	.long	.LASF122
	.byte	0x1
	.byte	0x23
	.long	0x5bd
	.uleb128 0x9
	.byte	0x3
	.quad	sPacket
	.uleb128 0x33
	.long	.LASF123
	.byte	0x9
	.byte	0xa8
	.long	0x38f
	.uleb128 0x33
	.long	.LASF124
	.byte	0x9
	.byte	0xa9
	.long	0x38f
	.uleb128 0x33
	.long	.LASF125
	.byte	0x9
	.byte	0xaa
	.long	0x38f
	.uleb128 0x34
	.long	.LASF126
	.long	.LASF126
	.byte	0xc
	.value	0x1e3
	.uleb128 0x35
	.long	.LASF127
	.long	.LASF127
	.byte	0x2
	.byte	0x55
	.uleb128 0x36
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x2
	.byte	0xa
	.byte	0
	.uleb128 0x37
	.long	.LASF146
	.long	.LASF147
	.byte	0x11
	.byte	0
	.long	.LASF146
	.uleb128 0x35
	.long	.LASF128
	.long	.LASF128
	.byte	0xd
	.byte	0x3b
	.uleb128 0x34
	.long	.LASF129
	.long	.LASF129
	.byte	0xc
	.value	0x1d2
	.uleb128 0x34
	.long	.LASF130
	.long	.LASF130
	.byte	0xc
	.value	0x1e0
	.uleb128 0x34
	.long	.LASF131
	.long	.LASF131
	.byte	0xe
	.value	0x2fa
	.uleb128 0x34
	.long	.LASF132
	.long	.LASF132
	.byte	0xe
	.value	0x305
	.uleb128 0x35
	.long	.LASF133
	.long	.LASF133
	.byte	0xf
	.byte	0x40
	.uleb128 0x35
	.long	.LASF134
	.long	.LASF134
	.byte	0xf
	.byte	0x50
	.uleb128 0x35
	.long	.LASF135
	.long	.LASF135
	.byte	0xf
	.byte	0x44
	.uleb128 0x35
	.long	.LASF136
	.long	.LASF136
	.byte	0x10
	.byte	0x95
	.uleb128 0x35
	.long	.LASF137
	.long	.LASF137
	.byte	0xf
	.byte	0x4a
	.uleb128 0x38
	.long	.LASF138
	.long	.LASF138
	.uleb128 0x38
	.long	.LASF95
	.long	.LASF95
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL4-.Ltext0
	.quad	.LFE66-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL6-.Ltext0
	.quad	.LVL7-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL7-1-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL13-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL17-.Ltext0
	.quad	.LFE65-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL6-.Ltext0
	.quad	.LVL7-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL7-1-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LVL14-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL14-1-.Ltext0
	.quad	.LFE65-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL15-.Ltext0
	.quad	.LVL16-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL16-1-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL8-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL10-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4481
	.sleb128 0
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL10-.Ltext0
	.quad	.LVL11-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL18-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL20-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL28-.Ltext0
	.quad	.LFE68-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL19-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL27-.Ltext0
	.quad	.LFE68-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL23-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-1-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4481
	.sleb128 0
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-1-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL33-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL36-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL56-.Ltext0
	.quad	.LFE72-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL35-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL41-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL44-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL51-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL54-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL55-.Ltext0
	.quad	.LFE72-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL34-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL40-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4481
	.sleb128 0
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL42-.Ltext0
	.quad	.LVL43-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL50-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL52-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+4481
	.sleb128 0
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-1-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL57-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL59-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL65-.Ltext0
	.quad	.LFE73-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL58-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL66-.Ltext0
	.quad	.LFE73-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL70-1-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL81-.Ltext0
	.quad	.LFE74-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL69-.Ltext0
	.quad	.LFE74-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL70-1-.Ltext0
	.quad	.LFE74-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL70-1-.Ltext0
	.quad	.LFE74-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL68-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.quad	.LVL73-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 2
	.byte	0x9f
	.quad	.LVL77-.Ltext0
	.quad	.LVL79-1-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL74-.Ltext0
	.quad	.LVL79-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL73-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+3354
	.sleb128 0
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL76-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 0
	.byte	0xa
	.value	0xffff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL79-1-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 0
	.byte	0xa
	.value	0xffff
	.byte	0x1a
	.byte	0x9f
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL76-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 4
	.byte	0x9f
	.quad	.LVL77-.Ltext0
	.quad	.LVL79-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL84-.Ltext0
	.quad	.LVL91-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL91-1-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL92-.Ltext0
	.quad	.LVL94-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL94-1-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL97-1-.Ltext0
	.quad	.LFE75-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL84-.Ltext0
	.quad	.LVL91-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL91-1-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL92-.Ltext0
	.quad	.LVL94-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL94-1-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL97-1-.Ltext0
	.quad	.LFE75-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL84-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL90-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL92-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL93-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL95-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL96-.Ltext0
	.quad	.LFE75-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL84-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL88-.Ltext0
	.quad	.LFE75-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL86-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL89-.Ltext0
	.quad	.LVL91-1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -26
	.quad	.LVL92-.Ltext0
	.quad	.LVL94-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL85-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL88-.Ltext0
	.quad	.LFE75-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL87-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL100-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL103-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL107-.Ltext0
	.quad	.LFE78-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL101-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 0
	.quad	.LVL102-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL105-.Ltext0
	.quad	.LVL106-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 32
	.quad	.LVL107-.Ltext0
	.quad	.LFE78-.Ltext0
	.value	0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x23
	.uleb128 0x20
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL109-.Ltext0
	.quad	.LFE76-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL108-.Ltext0
	.quad	.LVL110-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL110-1-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL111-.Ltext0
	.quad	.LFE76-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL114-1-.Ltext0
	.quad	.LFE79-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL113-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL115-.Ltext0
	.quad	.LFE79-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL117-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL122-.Ltext0
	.quad	.LFE80-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF106:
	.string	"pkt_release"
.LASF56:
	.string	"_shortbuf"
.LASF142:
	.string	"_IO_lock_t"
.LASF139:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -O -fPIC -fstack-protector-strong"
.LASF125:
	.string	"stderr"
.LASF45:
	.string	"_IO_buf_end"
.LASF116:
	.string	"iter_next"
.LASF43:
	.string	"_IO_write_end"
.LASF9:
	.string	"unsigned int"
.LASF89:
	.string	"next"
.LASF37:
	.string	"_flags"
.LASF101:
	.string	"pkt_init"
.LASF49:
	.string	"_markers"
.LASF146:
	.string	"fputc"
.LASF79:
	.string	"OctetType"
.LASF113:
	.string	"val8"
.LASF73:
	.string	"MsgDebug"
.LASF74:
	.string	"InvalidType"
.LASF132:
	.string	"pthread_mutex_unlock"
.LASF131:
	.string	"pthread_mutex_lock"
.LASF127:
	.string	"__fprintf_chk"
.LASF112:
	.string	"pkt_addnumeric"
.LASF136:
	.string	"send"
.LASF99:
	.string	"__bsx"
.LASF19:
	.string	"__pthread_internal_list"
.LASF8:
	.string	"uint32_t"
.LASF16:
	.string	"__prev"
.LASF121:
	.string	"__mutex"
.LASF124:
	.string	"stdout"
.LASF48:
	.string	"_IO_save_end"
.LASF22:
	.string	"__count"
.LASF117:
	.string	"pkt_begin"
.LASF129:
	.string	"malloc"
.LASF98:
	.string	"__len"
.LASF109:
	.string	"pkt_append"
.LASF33:
	.string	"long long unsigned int"
.LASF77:
	.string	"UnsignedType"
.LASF71:
	.string	"MsgError"
.LASF23:
	.string	"__owner"
.LASF58:
	.string	"_offset"
.LASF27:
	.string	"__elision"
.LASF96:
	.string	"__dest"
.LASF94:
	.string	"fprintf"
.LASF51:
	.string	"_fileno"
.LASF84:
	.string	"RawType"
.LASF15:
	.string	"size_t"
.LASF141:
	.string	"/home/liluchang/sda/usbnet-workspace/libusbnet"
.LASF107:
	.string	"pkt_recv"
.LASF40:
	.string	"_IO_read_base"
.LASF137:
	.string	"pack_size"
.LASF123:
	.string	"stdin"
.LASF67:
	.string	"_next"
.LASF126:
	.string	"free"
.LASF69:
	.string	"_pos"
.LASF82:
	.string	"SetType"
.LASF135:
	.string	"recv_full"
.LASF93:
	.string	"__fmt"
.LASF17:
	.string	"__next"
.LASF92:
	.string	"__stream"
.LASF14:
	.string	"char"
.LASF102:
	.string	"pkt_new"
.LASF64:
	.string	"_mode"
.LASF66:
	.string	"_IO_marker"
.LASF128:
	.string	"log_level"
.LASF38:
	.string	"_IO_read_ptr"
.LASF26:
	.string	"__spins"
.LASF4:
	.string	"uint8_t"
.LASF110:
	.string	"isize"
.LASF91:
	.string	"Iterator"
.LASF119:
	.string	"iter_enter"
.LASF100:
	.string	"pkt_free"
.LASF41:
	.string	"_IO_write_base"
.LASF86:
	.string	"bufsize"
.LASF28:
	.string	"__list"
.LASF34:
	.string	"long long int"
.LASF46:
	.string	"_IO_save_base"
.LASF103:
	.string	"pkt_reserve"
.LASF105:
	.string	"pkt_claim"
.LASF88:
	.string	"Packet"
.LASF122:
	.string	"sPacket"
.LASF87:
	.string	"size"
.LASF47:
	.string	"_IO_backup_base"
.LASF25:
	.string	"__kind"
.LASF83:
	.string	"StructureType"
.LASF59:
	.string	"__pad1"
.LASF60:
	.string	"__pad2"
.LASF61:
	.string	"__pad3"
.LASF62:
	.string	"__pad4"
.LASF63:
	.string	"__pad5"
.LASF133:
	.string	"pkt_recv_header"
.LASF85:
	.string	"CallType"
.LASF55:
	.string	"_vtable_offset"
.LASF108:
	.string	"pkt_send"
.LASF18:
	.string	"__pthread_list_t"
.LASF6:
	.string	"uint16_t"
.LASF81:
	.string	"EnumType"
.LASF39:
	.string	"_IO_read_end"
.LASF1:
	.string	"short int"
.LASF78:
	.string	"NullType"
.LASF2:
	.string	"long int"
.LASF111:
	.string	"wlen"
.LASF138:
	.string	"__stack_chk_fail"
.LASF144:
	.string	"__bswap_32"
.LASF143:
	.string	"LogLevel"
.LASF70:
	.string	"MsgNull"
.LASF29:
	.string	"__data"
.LASF24:
	.string	"__nusers"
.LASF57:
	.string	"_lock"
.LASF13:
	.string	"sizetype"
.LASF114:
	.string	"val16"
.LASF10:
	.string	"long unsigned int"
.LASF53:
	.string	"_old_offset"
.LASF36:
	.string	"_IO_FILE"
.LASF3:
	.string	"int32_t"
.LASF80:
	.string	"SequenceType"
.LASF32:
	.string	"pthread_mutex_t"
.LASF21:
	.string	"__lock"
.LASF90:
	.string	"type"
.LASF5:
	.string	"unsigned char"
.LASF68:
	.string	"_sbuf"
.LASF97:
	.string	"__src"
.LASF42:
	.string	"_IO_write_ptr"
.LASF115:
	.string	"iter_end"
.LASF75:
	.string	"BoolType"
.LASF130:
	.string	"realloc"
.LASF120:
	.string	"bsize"
.LASF11:
	.string	"__off_t"
.LASF145:
	.string	"pkt_shared"
.LASF0:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF140:
	.string	"src/proto/protocol.c"
.LASF95:
	.string	"memcpy"
.LASF104:
	.string	"__func__"
.LASF118:
	.string	"iter_nextval"
.LASF76:
	.string	"IntegerType"
.LASF31:
	.string	"__align"
.LASF50:
	.string	"_chain"
.LASF35:
	.string	"FILE"
.LASF52:
	.string	"_flags2"
.LASF147:
	.string	"__builtin_fputc"
.LASF30:
	.string	"__size"
.LASF54:
	.string	"_cur_column"
.LASF12:
	.string	"__off64_t"
.LASF65:
	.string	"_unused2"
.LASF44:
	.string	"_IO_buf_base"
.LASF20:
	.string	"__pthread_mutex_s"
.LASF134:
	.string	"unpack_size"
.LASF72:
	.string	"MsgLog"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
