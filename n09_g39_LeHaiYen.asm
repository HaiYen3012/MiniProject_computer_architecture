.data		       
        Line1: .asciiz  "                                           *************       \n"
	Line2: .asciiz  "**************                            *3333333333333*      \n"
	Line3: .asciiz  "*222222222222222*                         *33333********       \n"
	Line4: .asciiz  "*22222******222222*                       *33333*              \n"
	Line5: .asciiz  "*22222*      *22222*                      *33333********       \n"
	Line6: .asciiz  "*22222*       *22222*      *************  *3333333333333*      \n"
	Line7: .asciiz  "*22222*       *22222*    **11111*****111* *33333********       \n"
	Line8: .asciiz  "*22222*       *22222*  **1111**       **  *33333*              \n"
	Line9: .asciiz  "*22222*      *222222*  *1111*             *33333********       \n"
	Line10: .asciiz "*22222*******222222*  *11111*             *3333333333333*      \n"
	Line11: .asciiz "*2222222222222222*    *11111*              *************       \n"
	Line12: .asciiz "***************       *11111*                                  \n"
	Line13: .asciiz "      ---              *1111**                                 \n"
	Line14: .asciiz "    / o o \\             *1111****   *****                      \n"
	Line15: .asciiz "    \\   > /              **111111***111*                       \n"
	Line16: .asciiz "     -----                 ***********    dce.hust.edu.vn      \n"
	Msg0:   .asciiz "-----------------------------MENU---------------------------\n"
	Rq1:    .asciiz "1. Hien thi hinh anh.\n"
	Rq2:    .asciiz "2. Hinh anh chi con vien.\n"
	Rq3:    .asciiz "3. Hinh anh hoan doi vi tri thanh ECD.\n"
	Rq4:    .asciiz "4. Hinh anh sau khi doi mau chu.\n"
	Rq5:    .asciiz "5. Thoat.\n"
	Msg1:   .asciiz "------------------------------------------------------------\n"
	Msg2:   .asciiz "Nhap lua chon: "
	Msg3:   .asciiz "So khong phu hop. Xin vui long nhap lai.\n"
	Msg4:   .asciiz "Day la mau cu. Xin vui long nhap lai mau moi.\n"
	D:      .asciiz "Nhap mau cho chu D (0->9): "
	C:      .asciiz "Nhap mau cho chu C (0->9): "
	E:      .asciiz "Nhap mau cho chu E (0->9): "
.text
       li $s4, 2
       li $s5, 1
       li $s6, 3
       
main:
       la $a0, Msg0
       li $v0, 4
       syscall
        
       la $a0, Rq1
       li $v0, 4
       syscall
        
       la $a0, Rq2
       li $v0, 4
       syscall
        
       la $a0, Rq3
       li $v0, 4
       syscall
        
       la $a0, Rq4
       li $v0, 4
       syscall
        
       la $a0, Rq5
       li $v0, 4
       syscall
        
       la $a0, Msg1
       li $v0, 4
       syscall
        
       la $a0, Msg2
       li $v0, 4
       syscall
        
       li $v0, 5
       syscall
       
       Case1:
                   addi $v1, $0, 1
                   bne $v0, $v1, Case2
                   j Menu1
       Case2:
                   addi $v1, $0, 2
                   bne $v0, $v1, Case3
                   j Menu2
       Case3:
                   addi $v1, $0, 3
                   bne $v0, $v1, Case4
                   j Menu3
       Case4:
                   addi $v1, $0, 4
                   bne $v0, $v1, Case5
                   j Menu4
       Case5:
                   addi $v1, $0, 5
                   bne $v0, $v1, default
                   j Exit
       default:
                   la $a0, Msg3
                   li $v0, 4
                   syscall
                   j main
#---------------------------------1. Hien thi hinh anh.--------------------------------
Menu1:
       addi $s0, $0, 0            # Dat $s0 = 0 de dem so hang
       addi $s1, $0, 16           # Tong so hang la 16
       la $a0, Line1
       Loop1:
              beq $s0, $s1, main
              li $v0, 4
              syscall
              
              addi $a0, $a0, 65    # Cac line chua toi da 65 ky tu bien nay de truy cap den line tiep theo
              addi $s0, $s0, 1
              j Loop1
#---------------------------------2. Hinh anh chi con vien.--------------------------------
Menu2:
        addi $s0, $0, 0
        addi $s1, $0, 16
        la   $s2, Line1
        Loop2:
                beq $s0, $s1, main
                addi $t0, $0, 0
                addi $t1, $0, 65
        Loop2.1:
                beq $t0, $t1, Next
                lb $t2, 0($s2)
                bgt $t2, 57, print2
                blt $t2, 47, print2
                li $t2, 32
        print2:
                li $v0, 11
                add $a0, $0, $t2
                syscall
                
                addi $s2, $s2, 1
                addi $t0, $t0, 1
                j Loop2.1
        Next:
                addi $s0, $s0, 1
                j Loop2       
#---------------------------------3. Hinh anh hoan doi vi tri thanh ECD.--------------------------------
Menu3:
        addi $s0, $0, 0
        addi $s1, $0, 16
        la   $s2, Line1
        Loop3:
                beq $s1, $s0, main
                
                addi $s3, $s2, 42
                jal print3.2
                
                addi $s3, $s2, 21
                jal print3
                
                addi $s3, $s2, 0
                jal print3
                
                lb $t0, 63($s2)
                li $v0, 11
                move $a0, $t0
                syscall
                
                addi $s0, $s0, 1
                addi $s2, $s2, 65
                j Loop3
                
        print3:
                li $t1, 0
        Loop3.1:
                lb $t0, 0($s3)
                li $v0, 11
                move $a0, $t0
                syscall
                
                addi $s3, $s3, 1
                addi $t1, $t1, 1
                bne $t1, 21, Loop3.1
                jr $ra
                
        print3.2:
               li $t2, 0
        Loop3.2:
               lb $t3, 0($s3)
               li $t3, 32
               li $v0, 11
               move $a0, $t3
               syscall
                
                addi $s3, $s3, 1
                addi $t2, $t2, 1
                bne $t2, 21, Loop3.2
                jr $ra
#---------------------------------4. Hinh anh sau khi doi mau chu.--------------------------------
Menu4:
        # Nhap du lieu
        Nhap_mau_D:
                li $t3, 0
                li $v0, 4
                la $a0, D
                syscall
                
                li $v0, 5
                syscall
                
                blt $v0, 0, Error
                bgt $v0, 9, Error
                beq $v0, $s4, Error_1
                addi $t0, $v0, 48
        Nhap_mau_C:
                li $t3, 1
                li $v0, 4
                la $a0, C
                syscall
                
                li $v0, 5
                syscall
                
                blt $v0, 0, Error
                bgt $v0, 9, Error
                beq $v0, $s5, Error_1
                addi $t1, $v0, 48
         Nhap_mau_E:
                li $t3, 2
                li $v0, 4
                la $a0, E
                syscall
                
                li $v0, 5
                syscall
                
                blt $v0, 0, Error
                bgt $v0, 9, Error
                beq $v0, $s6, Error_1
                addi $t2, $v0, 48
                j Xu_li_du_lieu
        Error:
                li $v0, 4
                la $a0, Msg3
                syscall
                beq $t3, 0, Nhap_mau_D
                beq $t3, 1, Nhap_mau_C
                beq $t3, 2, Nhap_mau_E
       Error_1:
                li $v0, 4
                la $a0, Msg4
                syscall
                beq $t3, 0, Nhap_mau_D
                beq $t3, 1, Nhap_mau_C
                beq $t3, 2, Nhap_mau_E
                
        Xu_li_du_lieu: 
        addi $s0, $0, 0
        addi $s1, $0, 16
        la   $s2, Line1
        Loop4:
                beq $s1, $s0, main
                
                addi $s3, $s2, 0
                move $t4, $t0
                jal print4
                
                addi $s3, $s2, 21
                move $t4, $t1
                jal print4
                
                addi $s3, $s2, 42
                move $t4, $t2
                jal print4
                
                lb $t7, 63($s2)
                li $v0, 11
                move $a0, $t7
                syscall
                
                addi $s0, $s0, 1
                addi $s2, $s2, 65
                j Loop4
                
        print4:
                li $t5, 0
        Loop4.1:
                lb $t6, 0($s3)
                bgt $t6, 57, print4.1
                blt $t6, 48, print4.1
                move $t6, $t4
               
        print4.1:
                li $v0, 11
                move $a0, $t6
                syscall
                
                addi $s3, $s3, 1
                addi $t5, $t5, 1
                bne $t5, 21, Loop4.1
                jr $ra
Exit:
        li $v0, 10
        syscall
