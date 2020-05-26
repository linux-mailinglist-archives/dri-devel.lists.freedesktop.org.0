Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959461E3A12
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733BD6E293;
	Wed, 27 May 2020 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Tue, 26 May 2020 09:20:41 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E9E6E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 09:20:41 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id BE1881C02C0; Tue, 26 May 2020 11:10:55 +0200 (CEST)
Date: Tue, 26 May 2020 11:10:54 +0200
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@osdl.org>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com
Subject: next-20200515: Xorg killed due to "OOM"
Message-ID: <20200526091054.GA12103@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0078704159=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0078704159==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Machine was operating normally, with acceptable performance. Should
not have been anywhere near OOM. Then bang, blank scren, login
prompt. This is not the first time, either, and is rather annoying.

Hardware is 32-bit thinkpad X60.

What about those repeated "purging GPU memory" messages? Is that
normal? Should they be rate limited?

Any ideas?

Best regards,

	     	    	      	    	    	   	  Pavel

[38617.243260] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.258511] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.258875] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.259188] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.259498] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.259810] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.261887] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.262245] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.262560] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.262873] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.263186] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.263499] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.263812] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.268253] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.268614] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.268927] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.269241] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.269554] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.269867] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.270179] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.270491] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.270804] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.271137] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.271470] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.271783] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.276517] oom_reaper: reaped process 31769 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:7968kB
[38617.277232] Xorg invoked oom-killer: gfp_mask=3D0x0(), order=3D0, oom_sc=
ore_adj=3D0
[38617.277247] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200=
515+ #117
[38617.277256] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[38617.277266] Call Trace:
[38617.277286]  dump_stack+0x54/0x6e
[38617.277300]  dump_header+0x45/0x321
[38617.277313]  oom_kill_process.cold+0x9/0xe
[38617.277324]  ? out_of_memory+0x167/0x420
[38617.277336]  out_of_memory+0x1f2/0x420
[38617.277348]  pagefault_out_of_memory+0x34/0x56
[38617.277361]  mm_fault_error+0x4a/0x130
[38617.277372]  do_page_fault+0x3ce/0x416
[38617.277384]  ? vmalloc_sync_unmappings+0x10/0x10
[38617.277397]  common_exception_read_cr2+0x165/0x16a
[38617.277407] EIP: 0xb7e300a8
[38617.277420] Code: fc 83 fa 03 0f 8e e8 00 00 00 a8 0f 75 e4 83 fa 3f 7e =
a9 83 ea 40 89 c1 89 d6 c1 ee 06 8d 7e 01 c1 e7 06 8d 5c 3d 00 8d 76 00 <f3=
> 0f 6f 55 10 f3 0f 6f 4d 20 83 c5 40 83 c1 40 f3 0f 6f 45 f0 f3
[38617.277431] EAX: b6db1000 EBX: b6dab100 ECX: b6db1000 EDX: 000000d8
[38617.277441] ESI: 00000003 EDI: 00000100 EBP: b6dab000 ESP: bfc65030
[38617.277452] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00210206
[38617.277465]  ? bit_wait+0x1b/0x60
[38617.277476]  ? nmi+0xcc/0x2bc
[38617.281471] Mem-Info:
[38617.281492] active_anon:388906 inactive_anon:91828 isolated_anon:0
 active_file:18955 inactive_file:14809 isolated_file:0
 unevictable:787 dirty:156 writeback:8 unstable:0
 slab_reclaimable:6713 slab_unreclaimable:8712
 mapped:66221 shmem:43784 pagetables:7184 bounce:0
 free:211798 free_pcp:1154 free_cma:0
[38617.281509] Node 0 active_anon:1555624kB inactive_anon:367312kB active_f=
ile:75820kB inactive_file:59236kB unevictable:3148kB isolated(anon):0kB iso=
lated(file):0kB mapped:264884kB dirty:624kB writeback:32kB shmem:175136kB w=
riteback_tmp:0kB unstable:0kB all_unreclaimable? no
[38617.281527] DMA free:3092kB min:68kB low:84kB high:100kB reserved_highat=
omic:0KB active_anon:12348kB inactive_anon:0kB active_file:0kB inactive_fil=
e:0kB unevictable:0kB writepending:0kB present:15992kB managed:15916kB mloc=
ked:0kB kernel_stack:0kB pagetables:88kB bounce:0kB free_pcp:0kB local_pcp:=
0kB free_cma:0kB
[38617.281537] lowmem_reserve[]: 0 757 2934 757
[38617.281560] Normal free:154644kB min:3484kB low:4352kB high:5220kB reser=
ved_highatomic:0KB active_anon:480292kB inactive_anon:25580kB active_file:4=
968kB inactive_file:1600kB unevictable:0kB writepending:104kB present:89087=
2kB managed:776536kB mlocked:0kB kernel_stack:4976kB pagetables:28648kB bou=
nce:0kB free_pcp:2660kB local_pcp:1384kB free_cma:0kB
[38617.281569] lowmem_reserve[]: 0 0 17414 0
[38617.281592] HighMem free:689456kB min:512kB low:3012kB high:5512kB reser=
ved_highatomic:0KB active_anon:1063068kB inactive_anon:341720kB active_file=
:70792kB inactive_file:57320kB unevictable:3148kB writepending:452kB presen=
t:2229064kB managed:2229064kB mlocked:52kB kernel_stack:0kB pagetables:0kB =
bounce:0kB free_pcp:1940kB local_pcp:1236kB free_cma:0kB
[38617.281602] lowmem_reserve[]: 0 0 0 0
[38617.281616] DMA: 4*4kB (UM) 19*8kB (U) 17*16kB (UM) 13*32kB (UM) 15*64kB=
 (UM) 8*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3096kB
[38617.281652] Normal: 15715*4kB (UME) 7376*8kB (UME) 1340*16kB (UME) 34*32=
kB (UM) 161*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
=3D 154700kB
[38617.281686] HighMem: 74082*4kB (UME) 33277*8kB (UME) 6904*16kB (UME) 436=
*32kB (UME) 32*64kB (UME) 2*128kB (M) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB=
 0*4096kB =3D 689520kB
[38617.281787] 82310 total pagecache pages
[38617.281798] 4664 pages in swap cache
[38617.281808] Swap cache stats: add 272662, delete 267998, find 57067/86242
[38617.281817] Free swap  =3D 1663268kB
[38617.281825] Total swap =3D 2097148kB
[38617.281834] 783982 pages RAM
[38617.281843] 557266 pages HighMem/MovableOnly
[38617.281851] 28603 pages reserved
[38617.281860] Tasks state (memory values in pages):
[38617.281868] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swape=
nts oom_score_adj name
[38617.281896] [   2278]     0  2278     7323     4299    90112       44   =
          0 systemd-journal
[38617.281913] [   2501]     0  2501     3022      151    40960      267   =
      -1000 systemd-udevd
[38617.281930] [   2762]     0  2762     1484        0    45056       73   =
          0 rpcbind
[38617.281946] [   2775]   104  2775     1221       62    40960      120   =
          0 rpc.statd
[38617.281963] [   2789]     0  2789      805        5    36864       34   =
          0 rpc.idmapd
[38617.281979] [   2791]     0  2791     1410       75    40960       31   =
          0 bluetoothd
[38617.281996] [   2792]     0  2792    10524      145    81920      149   =
          0 accounts-daemon
[38617.282012] [   2793]     0  2793      935       24    40960       40   =
          0 atd
[38617.282028] [   2797]     0  2797    10615      327    77824      158   =
          0 ModemManager
[38617.282044] [   2798]     0  2798     1550       92    40960      138   =
          0 smartd
[38617.282061] [   2804]     0  2804    16578      752   114688      222   =
          0 NetworkManager
[38617.282077] [   2806]     0  2806     2094       63    45056       39   =
          0 cron
[38617.282093] [   2809]     0  2809     1697        3    45056       45   =
          0 irqbalance
[38617.282109] [   2813]     0  2813     1047       48    40960       46   =
          0 systemd-logind
[38617.282126] [   2814]     0  2814     1671      639    45056       25   =
          0 openvpn
[38617.282142] [   2849]   102  2849      958      139    36864       23   =
          0 avahi-daemon
[38617.282159] [   2853]   101  2853     1699      295    45056       63   =
       -900 dbus-daemon
[38617.282175] [   2865]     0  2865     1597       33    45056       32   =
          0 ofonod
[38617.282191] [   2889]   102  2889      958        6    36864       45   =
          0 avahi-daemon
[38617.282207] [   2911]     0  2911     8078      144    61440      168   =
          0 rsyslogd
[38617.282224] [   2917]     0  2917     3090        7    53248      136   =
          0 cups-browsed
[38617.282240] [   2926]   124  2926     5299       97    73728     1142   =
          0 timidity
[38617.282256] [   2928]     0  2928     2158      201    45056        0   =
      -1000 sshd
[38617.282272] [   2943]   111  2943    11822      419    90112      411   =
          0 colord
[38617.282288] [   2946]     0  2946     9660      234    73728      332   =
          0 polkitd
[38617.282305] [   2957]     0  2957     1241        0    40960       33   =
          0 agetty
[38617.282321] [   2968]     0  2968    11493      113    73728      102   =
          0 lightdm
[38617.282336] [   2978]     0  2978    19709     3585   139264     1458   =
          0 Xorg
[38617.282353] [   3260]   107  3260     1335       46    40960       61   =
          0 systemd
[38617.282369] [   3263]   107  3263     6320       87    57344      318   =
          0 (sd-pam)
[38617.282386] [   3277]   107  3277     1138        0    40960       65   =
          0 dbus-launch
[38617.282402] [   3282]   107  3282     1460       67    40960       69   =
          0 dbus-daemon
[38617.282418] [   3292]     0  3292     2055      205    45056       43   =
          0 wpa_supplicant
[38617.282435] [   3294]   107  3294     7194       26    65536       98   =
          0 at-spi2-registr
[38617.282451] [   3304]     0  3304     7395      135    65536      215   =
          0 lightdm
[38617.282467] [   3315]  1000  3315     1335       46    40960       59   =
          0 systemd
[38617.282483] [   3318]  1000  3318     6320      100    57344      306   =
          0 (sd-pam)
[38617.282499] [   3322]  1000  3322    15781      505    94208      385   =
          0 gnome-keyring-d
[38617.282515] [   3325]  1000  3325    14377      440   110592      283   =
          0 mate-session
[38617.282531] [   3350]  1000  3350     1183       10    40960       44   =
          0 ssh-agent
[38617.282548] [   3353]  1000  3353     1138        0    40960       65   =
          0 dbus-launch
[38617.282564] [   3354]  1000  3354     1584      346    40960       49   =
          0 dbus-daemon
[38617.282580] [   3359]  1000  3359     6710      137    53248      255   =
          0 dconf-service
[38617.282597] [   3366]  1000  3366    45425        2   167936      755   =
          0 mate-settings-d
[38617.282613] [   3367]  1000  3367    26073     2398   151552      358   =
          0 marco
[38617.282629] [   3374]  1000  3374    22371      981   135168      470   =
          0 mate-panel
[38617.282645] [   3376]  1000  3376    11608      143    90112      166   =
          0 gvfsd
[38617.282662] [   3395]  1000  3395    25518      667   155648      540   =
          0 caja
[38617.282678] [   3400]  1000  3400    10469      159   110592     1510   =
          0 applet.py
[38617.282694] [   3403]  1000  3403    18027     1515   122880      304   =
          0 wnck-applet
[38617.282710] [   3406]  1000  3406    11247      299   126976     1534   =
          0 smart-notifier
[38617.282726] [   3407]  1000  3407    11674      221    98304      238   =
          0 polkit-mate-aut
[38617.282742] [   3415]  1000  3415    11982      176    86016      133   =
          0 gvfs-udisks2-vo
[38617.282758] [   3416]  1000  3416    30735      972   122880      349   =
          0 mate-volume-con
[38617.282775] [   3419]     0  3419    13806      478    77824      179   =
          0 udisksd
[38617.282791] [   3420]  1000  3420    15365      353   114688      284   =
          0 mate-screensave
[38617.282807] [   3426]  1000  3426    22941     1403   151552      568   =
          0 nm-applet
[38617.282823] [   3427]  1000  3427    20721     1119   131072      398   =
          0 mate-power-mana
[38617.282839] [   3434]  1000  3434    26376     1088   159744      246   =
          0 pulseaudio
[38617.282855] [   3440]  1000  3440    21560      144   122880      275   =
          0 zeitgeist-datah
[38617.282872] [   3443]  1000  3443    14521        0    90112      225   =
          0 gvfs-afc-volume
[38617.282888] [   3453]  1000  3453    11293       29    81920      110   =
          0 gvfs-mtp-volume
[38617.282904] [   3458]  1000  3458    11423       94    65536      156   =
          0 at-spi-bus-laun
[38617.282921] [   3465]  1000  3465    11337       43    77824      158   =
          0 gvfs-goa-volume
[38617.282937] [   3469]  1000  3469     1433       38    40960       57   =
          0 dbus-daemon
[38617.282953] [   3475]  1000  3475    36798       57   167936      810   =
          0 goa-daemon
[38617.282969] [   3478]  1000  3478    14917      129    86016      237   =
          0 zeitgeist-daemo
[38617.282986] [   3482]     0  3482     8420       94    69632      104   =
          0 console-kit-dae
[38617.283002] [   3484]  1000  3484     7194       13    65536       98   =
          0 at-spi2-registr
[38617.283018] [   3488]  1000  3488    13764        0    94208      187   =
          0 gvfsd-trash
[38617.283034] [   3562]  1000  3562    18544       56   122880      487   =
          0 zeitgeist-fts
[38617.283050] [   3578]     0  3578    12257      127    86016      111   =
          0 upowerd
[38617.283066] [   3581]  1000  3581     1744        0    45056       16   =
          0 cat
[38617.283082] [   3595]  1000  3595    11510      166    77824      148   =
          0 gvfs-gphoto2-vo
[38617.283099] [   3599]  1000  3599     3405      198    57344      129   =
          0 gconfd-2
[38617.283115] [   3616]  1000  3616    16632     1081   114688      291   =
          0 command-applet
[38617.283132] [   3621]  1000  3621    13930      548   102400      332   =
          0 notification-ar
[38617.283148] [   3622]  1000  3622    14880      945   110592      288   =
          0 mate-inhibit-ap
[38617.283164] [   3641]  1000  3641     2079       81    49152       88   =
          0 xfconfd
[38617.283180] [   3757]  1000  3757    22119     1403   151552      421   =
          0 mate-terminal
[38617.283196] [   3763]  1000  3763      670       68    36864       31   =
          0 gnome-pty-helpe
[38617.283212] [   3764]  1000  3764     2565      449    49152      361   =
          0 bash
[38617.283229] [   4046]  1000  4046      620        1    36864       15   =
          0 start-pulseaudi
[38617.283245] [   4047]  1000  4047     3747      992    61440      452   =
          0 xprop
[38617.283261] [   4336]  1000  4336    22635     2117   151552      632   =
          0 mate-terminal
[38617.283278] [   4341]  1000  4341      670       60    36864       31   =
          0 gnome-pty-helpe
[38617.283294] [   4342]  1000  4342     2607      197    49152      425   =
          0 bash
[38617.283310] [   4439]  1000  4439    11055     1208   102400      294   =
          0 gkrellm
[38617.283326] [   4466]  1000  4466     2569      457    49152      362   =
          0 bash
[38617.283342] [   4507]  1000  4507     2575      640    49152      279   =
          0 bash
[38617.283358] [   4558]  1000  4558     2577      419    49152      394   =
          0 bash
[38617.283374] [   4990]  1000  4990     2567       38    49152      433   =
          0 bash
[38617.283390] [   5041]  1000  5041     2569      573    49152      216   =
          0 bash
[38617.283406] [   5341]  1000  5341     2563      137    49152      401   =
          0 bash
[38617.283423] [   5613]  1000  5613     2555       79    49152      446   =
          0 bash
[38617.283439] [   5619]  1000  5619     2082       66    45056       41   =
          0 tmpchromium
[38617.283455] [   5632]  1000  5632   334118    50906  1794048     2508   =
          0 chromium
[38617.283472] [   5638]  1000  5638    53234     1098   286720      528   =
          0 chromium
[38617.283488] [   5700]  1000  5700    86379     4186   573440      684   =
        300 chromium
[38617.283504] [   5796]  1000  5796   150075    14626  1253376     8888   =
        300 chromium
[38617.283521] [   5889]  1000  5889   144933    29449  1261568     3363   =
        300 chromium
[38617.283537] [   6939]  1000  6939   117568     3477   974848    15646   =
        300 chromium
[38617.283556] [  14032]  1000 14032   128197    22248   962560      480   =
        300 chromium
[38617.283572] [  14782]  1000 14782   148407    22579  1359872     9480   =
        300 chromium
[38617.283589] [  14915]  1000 14915   105049     5732   761856     7736   =
        300 chromium
[38617.283605] [  14959]  1000 14959    96816     3137   720896     5115   =
        300 chromium
[38617.283621] [  15866]  1000 15866     2081      105    45056        0   =
          0 e
[38617.283637] [  15868]  1000 15868    16769     1425   135168        1   =
          0 emacs
[38617.283654] [  15889]  1000 15889    96560     7486   700416      590   =
        300 chromium
[38617.283670] [  15951]  1000 15951   108112    15194   823296     1491   =
        300 chromium
[38617.283686] [  11060]  1000 11060   104396     8181   786432     5449   =
        300 chromium
[38617.283703] [  23950]  1000 23950   113414    18911   884736      540   =
        300 chromium
[38617.283719] [  24414]  1000 24414   108973     6468   811008     8447   =
        300 chromium
[38617.283738] [  32542]  1000 32542   116749    16072   937984      490   =
        300 chromium
[38617.283755] [    624]     0   624     1163      139    40960        0   =
          0 inetd
[38617.283771] [   1610]  1000  1610   115661    17507   933888      490   =
        300 chromium
[38617.283787] [   2599]     0  2599     4571      448    69632        0   =
          0 cupsd
[38617.283804] [   4059]  1000  4059   129842    28021  1032192      474   =
        300 chromium
[38617.283820] [   4388]  1000  4388    95412     7419   655360      486   =
        300 chromium
[38617.283837] [   6854]  1000  6854    96563     8793   720896     3446   =
        300 chromium
[38617.283857] [   8219]  1000  8219     2081      515    45056        0   =
          0 e
[38617.283873] [   8220]  1000  8220    16773     2804   139264        0   =
          0 emacs
[38617.283889] [   8492]  1000  8492   113292    26191   876544      477   =
        300 chromium
[38617.283905] [   8753]  1000  8753    94857    19848   696320      482   =
        300 chromium
[38617.283922] [   9774]  1000  9774     2082      525    45056        0   =
          0 e
[38617.290528] [   9775]  1000  9775    16780     2783   139264        0   =
          0 emacs
[38617.290555] [  11556]  1000 11556    91394    17315   651264      486   =
        300 chromium
[38617.290572] [  11576]  1000 11576    91260    17798   647168      481   =
        300 chromium
[38617.290588] [  11638]  1000 11638     2081      531    45056        0   =
          0 unis
[38617.290605] [  11639]  1000 11639     2081      530    45056        0   =
          0 long
[38617.290621] [  11642]  1000 11642   193995   184227  1544192        0   =
          0 unison
[38617.290638] [  11643]  1000 11643     2017      602    45056        0   =
          0 ssh
[38617.290758] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),task=
=3Dchromium,pid=3D5889,uid=3D1000
[38617.290906] Out of memory: Killed process 5889 (chromium) total-vm:57973=
2kB, anon-rss:93132kB, file-rss:24564kB, shmem-rss:100kB, UID:1000 pgtables=
:1232kB oom_score_adj:300
[38617.291094] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.291542] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.291830] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.292237] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.292800] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.293095] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.293380] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.293667] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.293954] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.294238] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.294521] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.294804] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.295087] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.295371] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.295655] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.298626] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.299062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.299347] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.299646] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.304085] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.304531] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.304816] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.305099] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.305382] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.305665] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.305951] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.306283] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.306566] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.306848] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.307132] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.307416] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.307766] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.308741] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.309052] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.309334] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.309617] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.309901] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.310183] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.310464] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.310746] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.311036] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.311369] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.311651] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.312032] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.319470] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.319635] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.319792] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.320022] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.320443] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.320599] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.320755] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.320910] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321067] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321245] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321452] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321610] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321766] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.321921] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322076] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322231] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322386] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322541] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322697] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.322853] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323009] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323164] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323320] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323475] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323630] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323786] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.323991] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.326833] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327014] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327170] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327327] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327483] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327640] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.327796] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.328027] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.328457] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.328615] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.328771] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.328928] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329085] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329307] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329464] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329620] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329775] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.329964] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330119] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330274] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330429] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330584] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330772] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.330927] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331082] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331268] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331423] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331577] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331732] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.331887] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.332516] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.332678] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.332832] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.332987] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333157] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333314] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333517] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333674] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333830] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.333985] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334141] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334296] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334451] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334607] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.334918] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335074] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335229] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335384] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335539] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.335851] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.336485] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.336646] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.336800] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.336955] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337110] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337266] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337421] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337634] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337790] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.337946] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338101] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338256] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338411] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338566] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338721] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.338876] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339031] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339193] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339348] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339504] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339659] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.339814] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.340026] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.340603] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.340761] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.340917] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341124] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341295] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341450] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341605] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341760] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.341915] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.342070] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.342225] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.342766] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.342962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343118] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343273] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343428] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343583] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343738] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.343893] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.344383] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.344540] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.344697] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.344852] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345007] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345162] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345316] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345472] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345668] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.345979] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346164] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346321] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346476] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346631] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346786] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.346941] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.347096] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.347252] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.349990] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.351467] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.351756] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.352554] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.352848] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.353132] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.353415] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.353698] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.353983] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.354267] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.354551] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.354834] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.355117] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.355401] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.355683] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.356038] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.356911] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.357216] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.357499] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.357782] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.358064] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.358509] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.358807] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.359087] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.359367] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.359647] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.359927] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.360973] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.361292] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.361573] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.361853] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.362133] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.362413] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.362693] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.362973] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.363253] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.363533] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.363813] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.364618] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.364908] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.365191] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.365474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.365757] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.366040] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.366361] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.366644] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.366927] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.367210] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.367494] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.367777] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.374380] oom_reaper: reaped process 5889 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:0kB
[38617.376594] Xorg invoked oom-killer: gfp_mask=3D0x0(), order=3D0, oom_sc=
ore_adj=3D0
[38617.376610] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200=
515+ #117
[38617.376620] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[38617.376629] Call Trace:
[38617.376649]  dump_stack+0x54/0x6e
[38617.376663]  dump_header+0x45/0x321
[38617.376676]  oom_kill_process.cold+0x9/0xe
[38617.376688]  ? out_of_memory+0x167/0x420
[38617.376700]  out_of_memory+0x1f2/0x420
[38617.376711]  pagefault_out_of_memory+0x34/0x56
[38617.376724]  mm_fault_error+0x4a/0x130
[38617.376735]  do_page_fault+0x3ce/0x416
[38617.376747]  ? vmalloc_sync_unmappings+0x10/0x10
[38617.376760]  common_exception_read_cr2+0x165/0x16a
[38617.376771] EIP: 0xb7e300a8
[38617.376783] Code: fc 83 fa 03 0f 8e e8 00 00 00 a8 0f 75 e4 83 fa 3f 7e =
a9 83 ea 40 89 c1 89 d6 c1 ee 06 8d 7e 01 c1 e7 06 8d 5c 3d 00 8d 76 00 <f3=
> 0f 6f 55 10 f3 0f 6f 4d 20 83 c5 40 83 c1 40 f3 0f 6f 45 f0 f3
[38617.376797] EAX: b6db1000 EBX: b6dab100 ECX: b6db1000 EDX: 000000d8
[38617.376807] ESI: 00000003 EDI: 00000100 EBP: b6dab000 ESP: bfc65030
[38617.376818] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00210206
[38617.376831]  ? bit_wait+0x1b/0x60
[38617.376843]  ? nmi+0xcc/0x2bc
[38617.376851] Mem-Info:
[38617.376870] active_anon:370281 inactive_anon:87578 isolated_anon:0
 active_file:18955 inactive_file:14834 isolated_file:0
 unevictable:787 dirty:181 writeback:8 unstable:0
 slab_reclaimable:6713 slab_unreclaimable:8712
 mapped:64171 shmem:42834 pagetables:6859 bounce:0
 free:235113 free_pcp:1305 free_cma:0
[38617.376886] Node 0 active_anon:1481124kB inactive_anon:350312kB active_f=
ile:75820kB inactive_file:59336kB unevictable:3148kB isolated(anon):0kB iso=
lated(file):0kB mapped:256684kB dirty:724kB writeback:32kB shmem:171336kB w=
riteback_tmp:0kB unstable:0kB all_unreclaimable? no
[38617.376904] DMA free:3092kB min:68kB low:84kB high:100kB reserved_highat=
omic:0KB active_anon:12348kB inactive_anon:0kB active_file:0kB inactive_fil=
e:0kB unevictable:0kB writepending:0kB present:15992kB managed:15916kB mloc=
ked:0kB kernel_stack:0kB pagetables:88kB bounce:0kB free_pcp:0kB local_pcp:=
0kB free_cma:0kB
[38617.376914] lowmem_reserve[]: 0 757 2934 757
[38617.376937] Normal free:173604kB min:3484kB low:4352kB high:5220kB reser=
ved_highatomic:0KB active_anon:474376kB inactive_anon:14972kB active_file:4=
968kB inactive_file:1600kB unevictable:0kB writepending:104kB present:89087=
2kB managed:776536kB mlocked:0kB kernel_stack:4856kB pagetables:27348kB bou=
nce:0kB free_pcp:2728kB local_pcp:1344kB free_cma:0kB
[38617.376947] lowmem_reserve[]: 0 0 17414 0
[38617.376971] HighMem free:763756kB min:512kB low:3012kB high:5512kB reser=
ved_highatomic:0KB active_anon:994468kB inactive_anon:335420kB active_file:=
70792kB inactive_file:57420kB unevictable:3148kB writepending:600kB present=
:2229064kB managed:2229064kB mlocked:52kB kernel_stack:0kB pagetables:0kB b=
ounce:0kB free_pcp:2492kB local_pcp:1504kB free_cma:0kB
[38617.376980] lowmem_reserve[]: 0 0 0 0
[38617.376994] DMA: 7*4kB (UM) 19*8kB (U) 17*16kB (UM) 13*32kB (UM) 15*64kB=
 (UM) 8*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3108kB
[38617.377031] Normal: 16344*4kB (UME) 8488*8kB (UME) 1726*16kB (UME) 76*32=
kB (UM) 162*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
=3D 173696kB
[38617.377065] HighMem: 77757*4kB (UME) 36392*8kB (UME) 8174*16kB (UME) 614=
*32kB (UME) 114*64kB (UME) 29*128kB (M) 1*256kB (M) 0*512kB 0*1024kB 0*2048=
kB 0*4096kB =3D 763860kB
[38617.377102] 80635 total pagecache pages
[38617.377113] 3916 pages in swap cache
[38617.377123] Swap cache stats: add 272684, delete 268768, find 57078/86739
[38617.377135] Free swap  =3D 1677860kB
[38617.377143] Total swap =3D 2097148kB
[38617.377152] 783982 pages RAM
[38617.377160] 557266 pages HighMem/MovableOnly
[38617.377169] 28603 pages reserved
[38617.377178] Tasks state (memory values in pages):
[38617.377186] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swape=
nts oom_score_adj name
[38617.377212] [   2278]     0  2278     7323     4365    90112       44   =
          0 systemd-journal
[38617.377229] [   2501]     0  2501     3022      151    40960      267   =
      -1000 systemd-udevd
[38617.377247] [   2762]     0  2762     1484        0    45056       73   =
          0 rpcbind
[38617.377263] [   2775]   104  2775     1221       62    40960      120   =
          0 rpc.statd
[38617.377279] [   2789]     0  2789      805        5    36864       34   =
          0 rpc.idmapd
[38617.377296] [   2791]     0  2791     1410       75    40960       31   =
          0 bluetoothd
[38617.377312] [   2792]     0  2792    10524      145    81920      149   =
          0 accounts-daemon
[38617.377330] [   2793]     0  2793      935       24    40960       40   =
          0 atd
[38617.377347] [   2797]     0  2797    10615      327    77824      158   =
          0 ModemManager
[38617.377363] [   2798]     0  2798     1550       92    40960      138   =
          0 smartd
[38617.377379] [   2804]     0  2804    16578      752   114688      222   =
          0 NetworkManager
[38617.377396] [   2806]     0  2806     2094       63    45056       39   =
          0 cron
[38617.377412] [   2809]     0  2809     1697        3    45056       45   =
          0 irqbalance
[38617.377429] [   2813]     0  2813     1047       48    40960       46   =
          0 systemd-logind
[38617.377445] [   2814]     0  2814     1671      639    45056       25   =
          0 openvpn
[38617.377462] [   2849]   102  2849      958      139    36864       23   =
          0 avahi-daemon
[38617.377479] [   2853]   101  2853     1699      295    45056       63   =
       -900 dbus-daemon
[38617.377498] [   2865]     0  2865     1597       33    45056       32   =
          0 ofonod
[38617.377514] [   2889]   102  2889      958        6    36864       45   =
          0 avahi-daemon
[38617.377530] [   2911]     0  2911     8078      144    61440      168   =
          0 rsyslogd
[38617.377547] [   2917]     0  2917     3090        7    53248      136   =
          0 cups-browsed
[38617.377563] [   2926]   124  2926     5299       97    73728     1142   =
          0 timidity
[38617.377579] [   2928]     0  2928     2158      201    45056        0   =
      -1000 sshd
[38617.377595] [   2943]   111  2943    11822      419    90112      411   =
          0 colord
[38617.377612] [   2946]     0  2946     9660      234    73728      332   =
          0 polkitd
[38617.377628] [   2957]     0  2957     1241        0    40960       33   =
          0 agetty
[38617.377644] [   2968]     0  2968    11493      113    73728      102   =
          0 lightdm
[38617.377660] [   2978]     0  2978    19709     3585   139264     1458   =
          0 Xorg
[38617.377680] [   3260]   107  3260     1335       46    40960       61   =
          0 systemd
[38617.377696] [   3263]   107  3263     6320       87    57344      318   =
          0 (sd-pam)
[38617.377713] [   3277]   107  3277     1138        0    40960       65   =
          0 dbus-launch
[38617.377729] [   3282]   107  3282     1460       67    40960       69   =
          0 dbus-daemon
[38617.377746] [   3292]     0  3292     2055      205    45056       43   =
          0 wpa_supplicant
[38617.377762] [   3294]   107  3294     7194       26    65536       98   =
          0 at-spi2-registr
[38617.377778] [   3304]     0  3304     7395      135    65536      215   =
          0 lightdm
[38617.377795] [   3315]  1000  3315     1335       46    40960       59   =
          0 systemd
[38617.377811] [   3318]  1000  3318     6320      100    57344      306   =
          0 (sd-pam)
[38617.377827] [   3322]  1000  3322    15781      505    94208      385   =
          0 gnome-keyring-d
[38617.377844] [   3325]  1000  3325    14377      440   110592      283   =
          0 mate-session
[38617.377863] [   3350]  1000  3350     1183       10    40960       44   =
          0 ssh-agent
[38617.377879] [   3353]  1000  3353     1138        0    40960       65   =
          0 dbus-launch
[38617.377895] [   3354]  1000  3354     1584      346    40960       49   =
          0 dbus-daemon
[38617.377912] [   3359]  1000  3359     6710      137    53248      255   =
          0 dconf-service
[38617.377928] [   3366]  1000  3366    45425        2   167936      755   =
          0 mate-settings-d
[38617.377945] [   3367]  1000  3367    26073     2398   151552      358   =
          0 marco
[38617.377961] [   3374]  1000  3374    22371      981   135168      470   =
          0 mate-panel
[38617.377977] [   3376]  1000  3376    11608      143    90112      166   =
          0 gvfsd
[38617.377994] [   3395]  1000  3395    25518      667   155648      540   =
          0 caja
[38617.378010] [   3400]  1000  3400    10469      159   110592     1510   =
          0 applet.py
[38617.378027] [   3403]  1000  3403    18027     1515   122880      304   =
          0 wnck-applet
[38617.378043] [   3406]  1000  3406    11247      299   126976     1534   =
          0 smart-notifier
[38617.378060] [   3407]  1000  3407    11674      221    98304      238   =
          0 polkit-mate-aut
[38617.378076] [   3415]  1000  3415    11982      176    86016      133   =
          0 gvfs-udisks2-vo
[38617.378093] [   3416]  1000  3416    30735      972   122880      349   =
          0 mate-volume-con
[38617.378109] [   3419]     0  3419    13806      478    77824      179   =
          0 udisksd
[38617.378195] [   3420]  1000  3420    15365      353   114688      284   =
          0 mate-screensave
[38617.378211] [   3426]  1000  3426    22941     1403   151552      568   =
          0 nm-applet
[38617.378228] [   3427]  1000  3427    20721     1119   131072      398   =
          0 mate-power-mana
[38617.378244] [   3434]  1000  3434    26376     1088   159744      246   =
          0 pulseaudio
[38617.378261] [   3440]  1000  3440    21560      144   122880      275   =
          0 zeitgeist-datah
[38617.378277] [   3443]  1000  3443    14521        0    90112      225   =
          0 gvfs-afc-volume
[38617.378294] [   3453]  1000  3453    11293       29    81920      110   =
          0 gvfs-mtp-volume
[38617.378310] [   3458]  1000  3458    11423       94    65536      156   =
          0 at-spi-bus-laun
[38617.378325] [   3465]  1000  3465    11337       43    77824      158   =
          0 gvfs-goa-volume
[38617.378341] [   3469]  1000  3469     1433       38    40960       57   =
          0 dbus-daemon
[38617.378357] [   3475]  1000  3475    36798       57   167936      810   =
          0 goa-daemon
[38617.378373] [   3478]  1000  3478    14917      129    86016      237   =
          0 zeitgeist-daemo
[38617.378389] [   3482]     0  3482     8420       94    69632      104   =
          0 console-kit-dae
[38617.378405] [   3484]  1000  3484     7194       13    65536       98   =
          0 at-spi2-registr
[38617.378421] [   3488]  1000  3488    13764        0    94208      187   =
          0 gvfsd-trash
[38617.378437] [   3562]  1000  3562    18544       56   122880      487   =
          0 zeitgeist-fts
[38617.378453] [   3578]     0  3578    12257      127    86016      111   =
          0 upowerd
[38617.378469] [   3581]  1000  3581     1744        0    45056       16   =
          0 cat
[38617.378485] [   3595]  1000  3595    11510      166    77824      148   =
          0 gvfs-gphoto2-vo
[38617.378500] [   3599]  1000  3599     3405      198    57344      129   =
          0 gconfd-2
[38617.378516] [   3616]  1000  3616    16632     1081   114688      291   =
          0 command-applet
[38617.378532] [   3621]  1000  3621    13930      548   102400      332   =
          0 notification-ar
[38617.378548] [   3622]  1000  3622    14880      945   110592      288   =
          0 mate-inhibit-ap
[38617.378564] [   3641]  1000  3641     2079       81    49152       88   =
          0 xfconfd
[38617.378580] [   3757]  1000  3757    22119     1403   151552      421   =
          0 mate-terminal
[38617.378596] [   3763]  1000  3763      670       68    36864       31   =
          0 gnome-pty-helpe
[38617.378611] [   3764]  1000  3764     2565      449    49152      361   =
          0 bash
[38617.378627] [   4046]  1000  4046      620        1    36864       15   =
          0 start-pulseaudi
[38617.378643] [   4047]  1000  4047     3747      992    61440      452   =
          0 xprop
[38617.378659] [   4336]  1000  4336    22635     2117   151552      632   =
          0 mate-terminal
[38617.378674] [   4341]  1000  4341      670       60    36864       31   =
          0 gnome-pty-helpe
[38617.378690] [   4342]  1000  4342     2607      197    49152      425   =
          0 bash
[38617.378706] [   4439]  1000  4439    11055     1208   102400      294   =
          0 gkrellm
[38617.378721] [   4466]  1000  4466     2569      457    49152      362   =
          0 bash
[38617.378737] [   4507]  1000  4507     2575      640    49152      279   =
          0 bash
[38617.378753] [   4558]  1000  4558     2577      419    49152      394   =
          0 bash
[38617.378768] [   4990]  1000  4990     2567       38    49152      433   =
          0 bash
[38617.378784] [   5041]  1000  5041     2569      573    49152      216   =
          0 bash
[38617.378799] [   5341]  1000  5341     2563      137    49152      401   =
          0 bash
[38617.378815] [   5613]  1000  5613     2555       79    49152      446   =
          0 bash
[38617.378831] [   5619]  1000  5619     2082       66    45056       41   =
          0 tmpchromium
[38617.378847] [   5632]  1000  5632   331043    50903  1789952     2508   =
          0 chromium
[38617.378863] [   5638]  1000  5638    53234     1098   286720      528   =
          0 chromium
[38617.378879] [   5700]  1000  5700    86379     4186   573440      684   =
        300 chromium
[38617.378895] [   5796]  1000  5796   150075    14626  1253376     8888   =
        300 chromium
[38617.378914] [   6939]  1000  6939   117568     3477   974848    15646   =
        300 chromium
[38617.378931] [  14032]  1000 14032   128197    22248   962560      480   =
        300 chromium
[38617.378947] [  14782]  1000 14782   148407    22579  1359872     9480   =
        300 chromium
[38617.378964] [  14915]  1000 14915   105049     5732   761856     7736   =
        300 chromium
[38617.378979] [  14959]  1000 14959    96816     3137   720896     5115   =
        300 chromium
[38617.378995] [  15866]  1000 15866     2081      105    45056        0   =
          0 e
[38617.379011] [  15868]  1000 15868    16769     1425   135168        1   =
          0 emacs
[38617.379027] [  15889]  1000 15889    96560     7486   700416      590   =
        300 chromium
[38617.379043] [  15951]  1000 15951   108112    15194   823296     1491   =
        300 chromium
[38617.379059] [  11060]  1000 11060   104396     8181   786432     5449   =
        300 chromium
[38617.379075] [  23950]  1000 23950   113414    18911   884736      540   =
        300 chromium
[38617.379090] [  24414]  1000 24414   108973     6468   811008     8447   =
        300 chromium
[38617.379109] [  32542]  1000 32542   116749    16072   937984      490   =
        300 chromium
[38617.379125] [    624]     0   624     1163      139    40960        0   =
          0 inetd
[38617.379141] [   1610]  1000  1610   115661    17507   933888      490   =
        300 chromium
[38617.379157] [   2599]     0  2599     4571      448    69632        0   =
          0 cupsd
[38617.379173] [   4059]  1000  4059   129842    28021  1032192      474   =
        300 chromium
[38617.379189] [   4388]  1000  4388    95412     7419   655360      486   =
        300 chromium
[38617.379205] [   6854]  1000  6854    96563     8793   720896     3446   =
        300 chromium
[38617.379223] [   8219]  1000  8219     2081      515    45056        0   =
          0 e
[38617.379239] [   8220]  1000  8220    16773     2804   139264        0   =
          0 emacs
[38617.379255] [   8492]  1000  8492   113292    26191   876544      477   =
        300 chromium
[38617.379270] [   8753]  1000  8753    94857    19848   696320      482   =
        300 chromium
[38617.379286] [   9774]  1000  9774     2082      525    45056        0   =
          0 e
[38617.379302] [   9775]  1000  9775    16780     2783   139264        0   =
          0 emacs
[38617.379321] [  11556]  1000 11556    91394    17315   651264      486   =
        300 chromium
[38617.379336] [  11576]  1000 11576    91260    17798   647168      481   =
        300 chromium
[38617.379352] [  11638]  1000 11638     2081      531    45056        0   =
          0 unis
[38617.379368] [  11639]  1000 11639     2081      530    45056        0   =
          0 long
[38617.379384] [  11642]  1000 11642   193995   185151  1552384        0   =
          0 unison
[38617.379400] [  11643]  1000 11643     2017      602    45056        0   =
          0 ssh
[38617.379412] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),task=
=3Dchromium,pid=3D14782,uid=3D1000
[38617.379535] Out of memory: Killed process 14782 (chromium) total-vm:5936=
28kB, anon-rss:86204kB, file-rss:3732kB, shmem-rss:380kB, UID:1000 pgtables=
:1328kB oom_score_adj:300
[38617.379677] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.380049] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.387289] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.387715] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.392153] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.392524] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.392810] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.393096] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.393381] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.393667] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.393952] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.394238] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.394523] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.394809] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.395094] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.396958] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.398784] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.399104] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.401551] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.401885] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.405714] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.407642] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.412222] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.412637] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.412924] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.413209] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.413495] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.413780] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.414066] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.414415] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.414702] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.414987] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.415273] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.415558] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.415843] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.418076] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.418386] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.418674] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.418962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.426447] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.429210] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.429416] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.429576] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.429773] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.429935] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430093] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430252] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430412] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430603] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.430921] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.431080] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.431271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.431431] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.431622] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.431782] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.437642] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.437963] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.438125] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.438284] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.438444] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.438603] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.438762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439063] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439224] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439384] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439543] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439702] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.439861] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.444197] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.444402] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.444561] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445149] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445315] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445633] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445791] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.445994] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.446181] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.446339] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.446497] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.446690] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.446849] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447007] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447165] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447323] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447480] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447638] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.447797] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.448188] oom_reaper: reaped process 14782 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:344kB
[38617.452380] Xorg invoked oom-killer: gfp_mask=3D0x0(), order=3D0, oom_sc=
ore_adj=3D0
[38617.452391] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200=
515+ #117
[38617.452396] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[38617.452401] Call Trace:
[38617.452415]  dump_stack+0x54/0x6e
[38617.452424]  dump_header+0x45/0x321
[38617.452431]  oom_kill_process.cold+0x9/0xe
[38617.452437]  ? out_of_memory+0x167/0x420
[38617.452444]  out_of_memory+0x1f2/0x420
[38617.452450]  pagefault_out_of_memory+0x34/0x56
[38617.452458]  mm_fault_error+0x4a/0x130
[38617.452464]  do_page_fault+0x3ce/0x416
[38617.452470]  ? vmalloc_sync_unmappings+0x10/0x10
[38617.452480]  common_exception_read_cr2+0x165/0x16a
[38617.452485] EIP: 0xb7e300a8
[38617.452493] Code: fc 83 fa 03 0f 8e e8 00 00 00 a8 0f 75 e4 83 fa 3f 7e =
a9 83 ea 40 89 c1 89 d6 c1 ee 06 8d 7e 01 c1 e7 06 8d 5c 3d 00 8d 76 00 <f3=
> 0f 6f 55 10 f3 0f 6f 4d 20 83 c5 40 83 c1 40 f3 0f 6f 45 f0 f3
[38617.452499] EAX: b6db1000 EBX: b6dab100 ECX: b6db1000 EDX: 000000d8
[38617.452504] ESI: 00000003 EDI: 00000100 EBP: b6dab000 ESP: bfc65030
[38617.452510] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00210206
[38617.452518]  ? bit_wait+0x1b/0x60
[38617.452524]  ? nmi+0xcc/0x2bc
[38617.452529] Mem-Info:
[38617.452540] active_anon:364706 inactive_anon:71928 isolated_anon:0
 active_file:19180 inactive_file:14834 isolated_file:0
 unevictable:787 dirty:206 writeback:8 unstable:0
 slab_reclaimable:6713 slab_unreclaimable:8712
 mapped:64196 shmem:41559 pagetables:6559 bounce:0
 free:256496 free_pcp:1194 free_cma:0
[38617.452549] Node 0 active_anon:1458824kB inactive_anon:287712kB active_f=
ile:76720kB inactive_file:59336kB unevictable:3148kB isolated(anon):0kB iso=
lated(file):0kB mapped:256784kB dirty:824kB writeback:32kB shmem:166236kB w=
riteback_tmp:0kB unstable:0kB all_unreclaimable? no
[38617.452559] DMA free:3092kB min:68kB low:84kB high:100kB reserved_highat=
omic:0KB active_anon:12348kB inactive_anon:0kB active_file:0kB inactive_fil=
e:0kB unevictable:0kB writepending:0kB present:15992kB managed:15916kB mloc=
ked:0kB kernel_stack:0kB pagetables:88kB bounce:0kB free_pcp:0kB local_pcp:=
0kB free_cma:0kB
[38617.452565] lowmem_reserve[]: 0 757 2934 757
[38617.452577] Normal free:174936kB min:3484kB low:4352kB high:5220kB reser=
ved_highatomic:0KB active_anon:474240kB inactive_anon:14904kB active_file:5=
228kB inactive_file:1944kB unevictable:0kB writepending:104kB present:89087=
2kB managed:776536kB mlocked:0kB kernel_stack:4784kB pagetables:26148kB bou=
nce:0kB free_pcp:2784kB local_pcp:1492kB free_cma:0kB
[38617.452584] lowmem_reserve[]: 0 0 17414 0
[38617.452597] HighMem free:847956kB min:512kB low:3012kB high:5512kB reser=
ved_highatomic:0KB active_anon:972368kB inactive_anon:272820kB active_file:=
71792kB inactive_file:57420kB unevictable:3148kB writepending:600kB present=
:2229064kB managed:2229064kB mlocked:52kB kernel_stack:0kB pagetables:0kB b=
ounce:0kB free_pcp:1992kB local_pcp:1264kB free_cma:0kB
[38617.452602] lowmem_reserve[]: 0 0 0 0
[38617.452610] DMA: 7*4kB (UM) 19*8kB (U) 17*16kB (UM) 13*32kB (UM) 15*64kB=
 (UM) 8*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3108kB
[38617.452630] Normal: 16429*4kB (UME) 8548*8kB (UME) 1749*16kB (UME) 81*32=
kB (UM) 162*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
=3D 175044kB
[38617.452649] HighMem: 82933*4kB (UME) 40307*8kB (UME) 9751*16kB (UME) 814=
*32kB (UME) 122*64kB (UME) 29*128kB (M) 1*256kB (M) 0*512kB 0*1024kB 0*2048=
kB 0*4096kB =3D 848028kB
[38617.452669] 79535 total pagecache pages
[38617.452676] 3880 pages in swap cache
[38617.452681] Swap cache stats: add 272704, delete 268824, find 57100/86958
[38617.452687] Free swap  =3D 1715236kB
[38617.452692] Total swap =3D 2097148kB
[38617.452697] 783982 pages RAM
[38617.452701] 557266 pages HighMem/MovableOnly
[38617.452706] 28603 pages reserved
[38617.452711] Tasks state (memory values in pages):
[38617.452715] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swape=
nts oom_score_adj name
[38617.452732] [   2278]     0  2278     7323     4365    90112       44   =
          0 systemd-journal
[38617.452741] [   2501]     0  2501     3022      151    40960      267   =
      -1000 systemd-udevd
[38617.452751] [   2762]     0  2762     1484        0    45056       73   =
          0 rpcbind
[38617.452760] [   2775]   104  2775     1221       62    40960      120   =
          0 rpc.statd
[38617.452770] [   2789]     0  2789      805        5    36864       34   =
          0 rpc.idmapd
[38617.452779] [   2791]     0  2791     1410       75    40960       31   =
          0 bluetoothd
[38617.452788] [   2792]     0  2792    10524      145    81920      149   =
          0 accounts-daemon
[38617.452799] [   2793]     0  2793      935       24    40960       40   =
          0 atd
[38617.452808] [   2797]     0  2797    10615      327    77824      158   =
          0 ModemManager
[38617.452817] [   2798]     0  2798     1550       92    40960      138   =
          0 smartd
[38617.452826] [   2804]     0  2804    16578      752   114688      222   =
          0 NetworkManager
[38617.452836] [   2806]     0  2806     2094       63    45056       39   =
          0 cron
[38617.452845] [   2809]     0  2809     1697        3    45056       45   =
          0 irqbalance
[38617.452854] [   2813]     0  2813     1047       48    40960       46   =
          0 systemd-logind
[38617.452863] [   2814]     0  2814     1671      639    45056       25   =
          0 openvpn
[38617.452872] [   2849]   102  2849      958      139    36864       23   =
          0 avahi-daemon
[38617.452882] [   2853]   101  2853     1699      295    45056       63   =
       -900 dbus-daemon
[38617.452891] [   2865]     0  2865     1597       33    45056       32   =
          0 ofonod
[38617.452900] [   2889]   102  2889      958        6    36864       45   =
          0 avahi-daemon
[38617.452909] [   2911]     0  2911     8078      144    61440      168   =
          0 rsyslogd
[38617.452919] [   2917]     0  2917     3090        7    53248      136   =
          0 cups-browsed
[38617.452928] [   2926]   124  2926     5299       97    73728     1142   =
          0 timidity
[38617.452937] [   2928]     0  2928     2158      201    45056        0   =
      -1000 sshd
[38617.452946] [   2943]   111  2943    11822      419    90112      411   =
          0 colord
[38617.452955] [   2946]     0  2946     9660      234    73728      332   =
          0 polkitd
[38617.452964] [   2957]     0  2957     1241        0    40960       33   =
          0 agetty
[38617.452973] [   2968]     0  2968    11493      113    73728      102   =
          0 lightdm
[38617.452982] [   2978]     0  2978    19709     3585   139264     1458   =
          0 Xorg
[38617.452991] [   3260]   107  3260     1335       46    40960       61   =
          0 systemd
[38617.453002] [   3263]   107  3263     6320       87    57344      318   =
          0 (sd-pam)
[38617.453011] [   3277]   107  3277     1138        0    40960       65   =
          0 dbus-launch
[38617.453020] [   3282]   107  3282     1460       67    40960       69   =
          0 dbus-daemon
[38617.453029] [   3292]     0  3292     2055      205    45056       43   =
          0 wpa_supplicant
[38617.453038] [   3294]   107  3294     7194       26    65536       98   =
          0 at-spi2-registr
[38617.453047] [   3304]     0  3304     7395      135    65536      215   =
          0 lightdm
[38617.453056] [   3315]  1000  3315     1335       46    40960       59   =
          0 systemd
[38617.453065] [   3318]  1000  3318     6320      100    57344      306   =
          0 (sd-pam)
[38617.453075] [   3322]  1000  3322    15781      505    94208      385   =
          0 gnome-keyring-d
[38617.453084] [   3325]  1000  3325    14377      440   110592      283   =
          0 mate-session
[38617.453093] [   3350]  1000  3350     1183       10    40960       44   =
          0 ssh-agent
[38617.453104] [   3353]  1000  3353     1138        0    40960       65   =
          0 dbus-launch
[38617.453114] [   3354]  1000  3354     1584      346    40960       49   =
          0 dbus-daemon
[38617.453123] [   3359]  1000  3359     6710      137    53248      255   =
          0 dconf-service
[38617.453132] [   3366]  1000  3366    45425        2   167936      755   =
          0 mate-settings-d
[38617.453141] [   3367]  1000  3367    26073     2398   151552      358   =
          0 marco
[38617.453151] [   3374]  1000  3374    22371      981   135168      470   =
          0 mate-panel
[38617.453160] [   3376]  1000  3376    11608      143    90112      166   =
          0 gvfsd
[38617.453169] [   3395]  1000  3395    25518      667   155648      540   =
          0 caja
[38617.453178] [   3400]  1000  3400    10469      159   110592     1510   =
          0 applet.py
[38617.453188] [   3403]  1000  3403    18027     1515   122880      304   =
          0 wnck-applet
[38617.453197] [   3406]  1000  3406    11247      299   126976     1534   =
          0 smart-notifier
[38617.453207] [   3407]  1000  3407    11674      221    98304      238   =
          0 polkit-mate-aut
[38617.453216] [   3415]  1000  3415    11982      176    86016      133   =
          0 gvfs-udisks2-vo
[38617.453226] [   3416]  1000  3416    30735      972   122880      349   =
          0 mate-volume-con
[38617.453235] [   3419]     0  3419    13806      478    77824      179   =
          0 udisksd
[38617.453244] [   3420]  1000  3420    15365      353   114688      284   =
          0 mate-screensave
[38617.453253] [   3426]  1000  3426    22941     1403   151552      568   =
          0 nm-applet
[38617.453262] [   3427]  1000  3427    20721     1119   131072      398   =
          0 mate-power-mana
[38617.453271] [   3434]  1000  3434    26376     1088   159744      246   =
          0 pulseaudio
[38617.453280] [   3440]  1000  3440    21560      144   122880      275   =
          0 zeitgeist-datah
[38617.453290] [   3443]  1000  3443    14521        0    90112      225   =
          0 gvfs-afc-volume
[38617.453299] [   3453]  1000  3453    11293       29    81920      110   =
          0 gvfs-mtp-volume
[38617.453308] [   3458]  1000  3458    11423       94    65536      156   =
          0 at-spi-bus-laun
[38617.453317] [   3465]  1000  3465    11337       43    77824      158   =
          0 gvfs-goa-volume
[38617.453326] [   3469]  1000  3469     1433       38    40960       57   =
          0 dbus-daemon
[38617.453336] [   3475]  1000  3475    36798       57   167936      810   =
          0 goa-daemon
[38617.453345] [   3478]  1000  3478    14917      129    86016      237   =
          0 zeitgeist-daemo
[38617.453354] [   3482]     0  3482     8420       94    69632      104   =
          0 console-kit-dae
[38617.453363] [   3484]  1000  3484     7194       13    65536       98   =
          0 at-spi2-registr
[38617.453373] [   3488]  1000  3488    13764        0    94208      187   =
          0 gvfsd-trash
[38617.453382] [   3562]  1000  3562    18544       56   122880      487   =
          0 zeitgeist-fts
[38617.453391] [   3578]     0  3578    12257      127    86016      111   =
          0 upowerd
[38617.453401] [   3581]  1000  3581     1744        0    45056       16   =
          0 cat
[38617.453410] [   3595]  1000  3595    11510      166    77824      148   =
          0 gvfs-gphoto2-vo
[38617.453419] [   3599]  1000  3599     3405      198    57344      129   =
          0 gconfd-2
[38617.453427] [   3616]  1000  3616    16632     1140   114688      291   =
          0 command-applet
[38617.453436] [   3621]  1000  3621    13930      548   102400      332   =
          0 notification-ar
[38617.453445] [   3622]  1000  3622    14880      945   110592      288   =
          0 mate-inhibit-ap
[38617.453454] [   3641]  1000  3641     2079       81    49152       88   =
          0 xfconfd
[38617.453462] [   3757]  1000  3757    22119     1403   151552      421   =
          0 mate-terminal
[38617.453471] [   3763]  1000  3763      670       68    36864       31   =
          0 gnome-pty-helpe
[38617.453480] [   3764]  1000  3764     2565      449    49152      361   =
          0 bash
[38617.453489] [   4046]  1000  4046      620        1    36864       15   =
          0 start-pulseaudi
[38617.453497] [   4047]  1000  4047     3747      992    61440      452   =
          0 xprop
[38617.453506] [   4336]  1000  4336    22635     2117   151552      632   =
          0 mate-terminal
[38617.453515] [   4341]  1000  4341      670       60    36864       31   =
          0 gnome-pty-helpe
[38617.453523] [   4342]  1000  4342     2607      197    49152      425   =
          0 bash
[38617.453532] [   4439]  1000  4439    11055     1208   102400      294   =
          0 gkrellm
[38617.453541] [   4466]  1000  4466     2569      457    49152      362   =
          0 bash
[38617.453549] [   4507]  1000  4507     2575      640    49152      279   =
          0 bash
[38617.453558] [   4558]  1000  4558     2577      419    49152      394   =
          0 bash
[38617.453566] [   4990]  1000  4990     2567       38    49152      433   =
          0 bash
[38617.453575] [   5041]  1000  5041     2569      573    49152      216   =
          0 bash
[38617.453584] [   5341]  1000  5341     2563      137    49152      401   =
          0 bash
[38617.453593] [   5613]  1000  5613     2555       79    49152      446   =
          0 bash
[38617.453601] [   5619]  1000  5619     2082       66    45056       41   =
          0 tmpchromium
[38617.453610] [   5632]  1000  5632   330018    50890  1785856     2508   =
          0 chromium
[38617.453619] [   5638]  1000  5638    53234     1098   286720      528   =
          0 chromium
[38617.453627] [   5700]  1000  5700    86379     4186   573440      684   =
        300 chromium
[38617.453636] [   5796]  1000  5796   150075    14626  1253376     8888   =
        300 chromium
[38617.453646] [   6939]  1000  6939   117568     3477   974848    15646   =
        300 chromium
[38617.453656] [  14032]  1000 14032   128197    22248   962560      480   =
        300 chromium
[38617.453666] [  14915]  1000 14915   105049     5732   761856     7736   =
        300 chromium
[38617.453675] [  14959]  1000 14959    96816     3137   720896     5115   =
        300 chromium
[38617.453684] [  15866]  1000 15866     2081      105    45056        0   =
          0 e
[38617.453692] [  15868]  1000 15868    16769     1425   135168        1   =
          0 emacs
[38617.453701] [  15889]  1000 15889    96560     7486   700416      590   =
        300 chromium
[38617.453710] [  15951]  1000 15951   108112    15194   823296     1491   =
        300 chromium
[38617.453719] [  11060]  1000 11060   104396     8181   786432     5449   =
        300 chromium
[38617.453727] [  23950]  1000 23950   113414    18911   884736      540   =
        300 chromium
[38617.453736] [  24414]  1000 24414   108973     6468   811008     8447   =
        300 chromium
[38617.453746] [  32542]  1000 32542   116749    16072   937984      490   =
        300 chromium
[38617.453755] [    624]     0   624     1163      139    40960        0   =
          0 inetd
[38617.453764] [   1610]  1000  1610   115661    17507   933888      490   =
        300 chromium
[38617.453772] [   2599]     0  2599     4571      448    69632        0   =
          0 cupsd
[38617.453781] [   4059]  1000  4059   129842    28021  1032192      474   =
        300 chromium
[38617.453790] [   4388]  1000  4388    95412     7419   655360      486   =
        300 chromium
[38617.453799] [   6854]  1000  6854    96563     8793   720896     3446   =
        300 chromium
[38617.453809] [   8219]  1000  8219     2081      515    45056        0   =
          0 e
[38617.453818] [   8220]  1000  8220    16773     2804   139264        0   =
          0 emacs
[38617.453827] [   8492]  1000  8492   113292    26191   876544      477   =
        300 chromium
[38617.453836] [   8753]  1000  8753    94857    19848   696320      482   =
        300 chromium
[38617.453844] [   9774]  1000  9774     2082      525    45056        0   =
          0 e
[38617.453853] [   9775]  1000  9775    16780     2783   139264        0   =
          0 emacs
[38617.453863] [  11556]  1000 11556    91394    17315   651264      486   =
        300 chromium
[38617.453872] [  11576]  1000 11576    91260    17798   647168      481   =
        300 chromium
[38617.453880] [  11638]  1000 11638     2081      531    45056        0   =
          0 unis
[38617.453889] [  11639]  1000 11639     2081      530    45056        0   =
          0 long
[38617.453898] [  11642]  1000 11642   193995   186141  1556480        0   =
          0 unison
[38617.453907] [  11643]  1000 11643     2017      602    45056        0   =
          0 ssh
[38617.453914] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),task=
=3Dchromium,pid=3D4059,uid=3D1000
[38617.454015] Out of memory: Killed process 4059 (chromium) total-vm:51936=
8kB, anon-rss:83204kB, file-rss:26348kB, shmem-rss:2532kB, UID:1000 pgtable=
s:1008kB oom_score_adj:300
[38617.454106] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.454303] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.454479] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.454655] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.454831] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.455006] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.468247] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.468756] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.469073] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.469387] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.469702] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.470016] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.470330] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.470644] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.470958] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.471313] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.471632] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.472710] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.473062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.473380] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.473695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.474009] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.474324] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.474639] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.474954] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.475269] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.475584] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.475900] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.480530] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.480870] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.481222] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.481540] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.481857] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.482173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.482490] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.482806] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.483123] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.483439] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.483756] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.488277] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.488677] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.488996] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.489314] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.489633] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.489952] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.490271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.490590] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.490908] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.491278] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.491598] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.491917] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.498627] Xorg invoked oom-killer: gfp_mask=3D0x0(), order=3D0, oom_sc=
ore_adj=3D0
[38617.498644] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200=
515+ #117
[38617.498654] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[38617.498663] Call Trace:
[38617.498684]  dump_stack+0x54/0x6e
[38617.498698]  dump_header+0x45/0x321
[38617.498711]  oom_kill_process.cold+0x9/0xe
[38617.498722]  ? out_of_memory+0x167/0x420
[38617.498734]  out_of_memory+0x1f2/0x420
[38617.498746]  pagefault_out_of_memory+0x34/0x56
[38617.498759]  mm_fault_error+0x4a/0x130
[38617.498770]  do_page_fault+0x3ce/0x416
[38617.498782]  ? vmalloc_sync_unmappings+0x10/0x10
[38617.498795]  common_exception_read_cr2+0x165/0x16a
[38617.498806] EIP: 0xb7e300a8
[38617.498818] Code: fc 83 fa 03 0f 8e e8 00 00 00 a8 0f 75 e4 83 fa 3f 7e =
a9 83 ea 40 89 c1 89 d6 c1 ee 06 8d 7e 01 c1 e7 06 8d 5c 3d 00 8d 76 00 <f3=
> 0f 6f 55 10 f3 0f 6f 4d 20 83 c5 40 83 c1 40 f3 0f 6f 45 f0 f3
[38617.498829] EAX: b6db1000 EBX: b6dab100 ECX: b6db1000 EDX: 000000d8
[38617.498839] ESI: 00000003 EDI: 00000100 EBP: b6dab000 ESP: bfc65030
[38617.498850] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00210206
[38617.498863]  ? bit_wait+0x1b/0x60
[38617.498875]  ? nmi+0xcc/0x2bc
[38617.498883] Mem-Info:
[38617.498902] active_anon:345106 inactive_anon:71878 isolated_anon:0
 active_file:19305 inactive_file:14809 isolated_file:0
 unevictable:787 dirty:206 writeback:8 unstable:0
 slab_reclaimable:6713 slab_unreclaimable:8712
 mapped:64096 shmem:41559 pagetables:6559 bounce:0
 free:275930 free_pcp:1152 free_cma:0
[38617.498918] Node 0 active_anon:1380424kB inactive_anon:287512kB active_f=
ile:77220kB inactive_file:59236kB unevictable:3148kB isolated(anon):0kB iso=
lated(file):0kB mapped:256384kB dirty:824kB writeback:32kB shmem:166236kB w=
riteback_tmp:0kB unstable:0kB all_unreclaimable? no
[38617.498937] DMA free:3112kB min:68kB low:84kB high:100kB reserved_highat=
omic:0KB active_anon:12348kB inactive_anon:0kB active_file:0kB inactive_fil=
e:0kB unevictable:0kB writepending:0kB present:15992kB managed:15916kB mloc=
ked:0kB kernel_stack:0kB pagetables:88kB bounce:0kB free_pcp:0kB local_pcp:=
0kB free_cma:0kB
[38617.498946] lowmem_reserve[]: 0 757 2934 757
[38617.498969] Normal free:175352kB min:3484kB low:4352kB high:5220kB reser=
ved_highatomic:0KB active_anon:474104kB inactive_anon:14904kB active_file:5=
228kB inactive_file:1944kB unevictable:0kB writepending:104kB present:89087=
2kB managed:776536kB mlocked:0kB kernel_stack:4664kB pagetables:26148kB bou=
nce:0kB free_pcp:2696kB local_pcp:1316kB free_cma:0kB
[38617.498979] lowmem_reserve[]: 0 0 17414 0
[38617.499002] HighMem free:925256kB min:512kB low:3012kB high:5512kB reser=
ved_highatomic:0KB active_anon:894068kB inactive_anon:272620kB active_file:=
72092kB inactive_file:57420kB unevictable:3148kB writepending:748kB present=
:2229064kB managed:2229064kB mlocked:52kB kernel_stack:0kB pagetables:0kB b=
ounce:0kB free_pcp:1896kB local_pcp:1424kB free_cma:0kB
[38617.499011] lowmem_reserve[]: 0 0 0 0
[38617.499025] DMA: 9*4kB (UM) 19*8kB (U) 17*16kB (UM) 13*32kB (UM) 15*64kB=
 (UM) 8*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3116kB
[38617.499062] Normal: 16474*4kB (UME) 8568*8kB (UME) 1751*16kB (UME) 81*32=
kB (UM) 162*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
=3D 175416kB
[38617.499096] HighMem: 88980*4kB (UME) 43856*8kB (UME) 10978*16kB (UME) 95=
5*32kB (UME) 128*64kB (UME) 31*128kB (M) 1*256kB (M) 0*512kB 0*1024kB 0*204=
8kB 0*4096kB =3D 925392kB
[38617.499132] 79560 total pagecache pages
[38617.499144] 3883 pages in swap cache
[38617.499154] Swap cache stats: add 272718, delete 268835, find 57105/87072
[38617.499163] Free swap  =3D 1715236kB
[38617.499172] Total swap =3D 2097148kB
[38617.499180] 783982 pages RAM
[38617.499189] 557266 pages HighMem/MovableOnly
[38617.499197] 28603 pages reserved
[38617.499206] Tasks state (memory values in pages):
[38617.499214] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swape=
nts oom_score_adj name
[38617.499232] [   2278]     0  2278     7323     4365    90112       44   =
          0 systemd-journal
[38617.499248] [   2501]     0  2501     3022      151    40960      267   =
      -1000 systemd-udevd
[38617.499265] [   2762]     0  2762     1484        0    45056       73   =
          0 rpcbind
[38617.499281] [   2775]   104  2775     1221       62    40960      120   =
          0 rpc.statd
[38617.499297] [   2789]     0  2789      805        5    36864       34   =
          0 rpc.idmapd
[38617.499312] [   2791]     0  2791     1410       75    40960       31   =
          0 bluetoothd
[38617.499328] [   2792]     0  2792    10524      145    81920      149   =
          0 accounts-daemon
[38617.499344] [   2793]     0  2793      935       24    40960       40   =
          0 atd
[38617.499360] [   2797]     0  2797    10615      327    77824      158   =
          0 ModemManager
[38617.499376] [   2798]     0  2798     1550       92    40960      138   =
          0 smartd
[38617.499392] [   2804]     0  2804    16578      752   114688      222   =
          0 NetworkManager
[38617.499408] [   2806]     0  2806     2094       63    45056       39   =
          0 cron
[38617.499424] [   2809]     0  2809     1697        3    45056       45   =
          0 irqbalance
[38617.499439] [   2813]     0  2813     1047       48    40960       46   =
          0 systemd-logind
[38617.499455] [   2814]     0  2814     1671      639    45056       25   =
          0 openvpn
[38617.499471] [   2849]   102  2849      958      139    36864       23   =
          0 avahi-daemon
[38617.499487] [   2853]   101  2853     1699      295    45056       63   =
       -900 dbus-daemon
[38617.499503] [   2865]     0  2865     1597       33    45056       32   =
          0 ofonod
[38617.499519] [   2889]   102  2889      958        6    36864       45   =
          0 avahi-daemon
[38617.499534] [   2911]     0  2911     8078      144    61440      168   =
          0 rsyslogd
[38617.499550] [   2917]     0  2917     3090        7    53248      136   =
          0 cups-browsed
[38617.499566] [   2926]   124  2926     5299       97    73728     1142   =
          0 timidity
[38617.499582] [   2928]     0  2928     2158      201    45056        0   =
      -1000 sshd
[38617.499598] [   2943]   111  2943    11822      419    90112      411   =
          0 colord
[38617.499613] [   2946]     0  2946     9660      234    73728      332   =
          0 polkitd
[38617.499629] [   2957]     0  2957     1241        0    40960       33   =
          0 agetty
[38617.499645] [   2968]     0  2968    11493      113    73728      102   =
          0 lightdm
[38617.499660] [   2978]     0  2978    19709     3585   139264     1458   =
          0 Xorg
[38617.499676] [   3260]   107  3260     1335       46    40960       61   =
          0 systemd
[38617.499692] [   3263]   107  3263     6320       87    57344      318   =
          0 (sd-pam)
[38617.499707] [   3277]   107  3277     1138        0    40960       65   =
          0 dbus-launch
[38617.499723] [   3282]   107  3282     1460       67    40960       69   =
          0 dbus-daemon
[38617.499739] [   3292]     0  3292     2055      205    45056       43   =
          0 wpa_supplicant
[38617.499755] [   3294]   107  3294     7194       26    65536       98   =
          0 at-spi2-registr
[38617.499771] [   3304]     0  3304     7395      135    65536      215   =
          0 lightdm
[38617.499787] [   3315]  1000  3315     1335       46    40960       59   =
          0 systemd
[38617.499803] [   3318]  1000  3318     6320      100    57344      306   =
          0 (sd-pam)
[38617.499818] [   3322]  1000  3322    15781      505    94208      385   =
          0 gnome-keyring-d
[38617.499834] [   3325]  1000  3325    14377      440   110592      283   =
          0 mate-session
[38617.499850] [   3350]  1000  3350     1183       10    40960       44   =
          0 ssh-agent
[38617.499866] [   3353]  1000  3353     1138        0    40960       65   =
          0 dbus-launch
[38617.499882] [   3354]  1000  3354     1584      346    40960       49   =
          0 dbus-daemon
[38617.499898] [   3359]  1000  3359     6710      137    53248      255   =
          0 dconf-service
[38617.499914] [   3366]  1000  3366    45425        2   167936      755   =
          0 mate-settings-d
[38617.500011] [   3367]  1000  3367    26073     2398   151552      358   =
          0 marco
[38617.500991] oom_reaper: reaped process 4059 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:2540kB
[38617.502804] [   3374]  1000  3374    22371      981   135168      470   =
          0 mate-panel
[38617.502822] [   3376]  1000  3376    11608      143    90112      166   =
          0 gvfsd
[38617.502838] [   3395]  1000  3395    25518      667   155648      540   =
          0 caja
[38617.502855] [   3400]  1000  3400    10469      159   110592     1510   =
          0 applet.py
[38617.502871] [   3403]  1000  3403    18027     1515   122880      304   =
          0 wnck-applet
[38617.502887] [   3406]  1000  3406    11247      299   126976     1534   =
          0 smart-notifier
[38617.502904] [   3407]  1000  3407    11674      221    98304      238   =
          0 polkit-mate-aut
[38617.502921] [   3415]  1000  3415    11982      176    86016      133   =
          0 gvfs-udisks2-vo
[38617.502937] [   3416]  1000  3416    30735      972   122880      349   =
          0 mate-volume-con
[38617.502953] [   3419]     0  3419    13806      478    77824      179   =
          0 udisksd
[38617.502970] [   3420]  1000  3420    15365      353   114688      284   =
          0 mate-screensave
[38617.502986] [   3426]  1000  3426    22941     1403   151552      568   =
          0 nm-applet
[38617.503002] [   3427]  1000  3427    20721     1119   131072      398   =
          0 mate-power-mana
[38617.503019] [   3434]  1000  3434    26376     1088   159744      246   =
          0 pulseaudio
[38617.503035] [   3440]  1000  3440    21560      144   122880      275   =
          0 zeitgeist-datah
[38617.503051] [   3443]  1000  3443    14521        0    90112      225   =
          0 gvfs-afc-volume
[38617.503068] [   3453]  1000  3453    11293       29    81920      110   =
          0 gvfs-mtp-volume
[38617.503084] [   3458]  1000  3458    11423       94    65536      156   =
          0 at-spi-bus-laun
[38617.503100] [   3465]  1000  3465    11337       43    77824      158   =
          0 gvfs-goa-volume
[38617.503116] [   3469]  1000  3469     1433       38    40960       57   =
          0 dbus-daemon
[38617.503132] [   3475]  1000  3475    36798       57   167936      810   =
          0 goa-daemon
[38617.503148] [   3478]  1000  3478    14917      129    86016      237   =
          0 zeitgeist-daemo
[38617.503165] [   3482]     0  3482     8420       94    69632      104   =
          0 console-kit-dae
[38617.503181] [   3484]  1000  3484     7194       13    65536       98   =
          0 at-spi2-registr
[38617.503197] [   3488]  1000  3488    13764        0    94208      187   =
          0 gvfsd-trash
[38617.503213] [   3562]  1000  3562    18544       56   122880      487   =
          0 zeitgeist-fts
[38617.503229] [   3578]     0  3578    12257      127    86016      111   =
          0 upowerd
[38617.503245] [   3581]  1000  3581     1744        0    45056       16   =
          0 cat
[38617.503261] [   3595]  1000  3595    11510      166    77824      148   =
          0 gvfs-gphoto2-vo
[38617.503277] [   3599]  1000  3599     3405      198    57344      129   =
          0 gconfd-2
[38617.503294] [   3616]  1000  3616    16632     1140   114688      291   =
          0 command-applet
[38617.503310] [   3621]  1000  3621    13930      548   102400      332   =
          0 notification-ar
[38617.503326] [   3622]  1000  3622    14880      945   110592      288   =
          0 mate-inhibit-ap
[38617.503342] [   3641]  1000  3641     2079       81    49152       88   =
          0 xfconfd
[38617.503359] [   3757]  1000  3757    22119     1403   151552      421   =
          0 mate-terminal
[38617.503375] [   3763]  1000  3763      670       68    36864       31   =
          0 gnome-pty-helpe
[38617.503391] [   3764]  1000  3764     2565      449    49152      361   =
          0 bash
[38617.503407] [   4046]  1000  4046      620        1    36864       15   =
          0 start-pulseaudi
[38617.503423] [   4047]  1000  4047     3747      992    61440      452   =
          0 xprop
[38617.503439] [   4336]  1000  4336    22635     2117   151552      632   =
          0 mate-terminal
[38617.503456] [   4341]  1000  4341      670       60    36864       31   =
          0 gnome-pty-helpe
[38617.503472] [   4342]  1000  4342     2607      197    49152      425   =
          0 bash
[38617.503488] [   4439]  1000  4439    11055     1208   102400      294   =
          0 gkrellm
[38617.503504] [   4466]  1000  4466     2569      457    49152      362   =
          0 bash
[38617.503520] [   4507]  1000  4507     2575      640    49152      279   =
          0 bash
[38617.503536] [   4558]  1000  4558     2577      419    49152      394   =
          0 bash
[38617.503552] [   4990]  1000  4990     2567       38    49152      433   =
          0 bash
[38617.503568] [   5041]  1000  5041     2569      573    49152      216   =
          0 bash
[38617.503584] [   5341]  1000  5341     2563      137    49152      401   =
          0 bash
[38617.503600] [   5613]  1000  5613     2555       79    49152      446   =
          0 bash
[38617.503616] [   5619]  1000  5619     2082       66    45056       41   =
          0 tmpchromium
[38617.503633] [   5632]  1000  5632   330018    50888  1785856     2508   =
          0 chromium
[38617.503649] [   5638]  1000  5638    53234     1098   286720      528   =
          0 chromium
[38617.503665] [   5700]  1000  5700    86379     4186   573440      684   =
        300 chromium
[38617.503681] [   5796]  1000  5796   150075    14626  1253376     8888   =
        300 chromium
[38617.503700] [   6939]  1000  6939   117568     3477   974848    15646   =
        300 chromium
[38617.503718] [  14032]  1000 14032   128197    22248   962560      480   =
        300 chromium
[38617.503737] [  14915]  1000 14915   105049     5732   761856     7736   =
        300 chromium
[38617.503754] [  14959]  1000 14959    96816     3137   720896     5115   =
        300 chromium
[38617.503770] [  15866]  1000 15866     2081      105    45056        0   =
          0 e
[38617.503787] [  15868]  1000 15868    16769     1425   135168        1   =
          0 emacs
[38617.503803] [  15889]  1000 15889    96560     7486   700416      590   =
        300 chromium
[38617.503819] [  15951]  1000 15951   108112    15194   823296     1491   =
        300 chromium
[38617.503835] [  11060]  1000 11060   104396     8181   786432     5449   =
        300 chromium
[38617.503852] [  23950]  1000 23950   113414    18911   884736      540   =
        300 chromium
[38617.503868] [  24414]  1000 24414   108973     6468   811008     8447   =
        300 chromium
[38617.503887] [  32542]  1000 32542   116749    16072   937984      490   =
        300 chromium
[38617.503903] [    624]     0   624     1163      139    40960        0   =
          0 inetd
[38617.503920] [   1610]  1000  1610   115661    17507   933888      490   =
        300 chromium
[38617.508032] [   2599]     0  2599     4571      448    69632        0   =
          0 cupsd
[38617.508055] [   4388]  1000  4388    95412     7419   655360      486   =
        300 chromium
[38617.508073] [   6854]  1000  6854    96563     8793   720896     3446   =
        300 chromium
[38617.508091] [   8219]  1000  8219     2081      515    45056        0   =
          0 e
[38617.508108] [   8220]  1000  8220    16773     2804   139264        0   =
          0 emacs
[38617.508124] [   8492]  1000  8492   113292    26191   876544      477   =
        300 chromium
[38617.508141] [   8753]  1000  8753    94857    19848   696320      482   =
        300 chromium
[38617.508157] [   9774]  1000  9774     2082      525    45056        0   =
          0 e
[38617.508174] [   9775]  1000  9775    16780     2783   139264        0   =
          0 emacs
[38617.508198] [  11556]  1000 11556    91394    17315   651264      486   =
        300 chromium
[38617.508214] [  11576]  1000 11576    91260    17798   647168      481   =
        300 chromium
[38617.508230] [  11638]  1000 11638     2081      531    45056        0   =
          0 unis
[38617.508247] [  11639]  1000 11639     2081      530    45056        0   =
          0 long
[38617.508263] [  11642]  1000 11642   193995   186933  1564672        0   =
          0 unison
[38617.508280] [  11643]  1000 11643     2017      602    45056        0   =
          0 ssh
[38617.508333] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),task=
=3Dchromium,pid=3D8492,uid=3D1000
[38617.508464] Out of memory: Killed process 8492 (chromium) total-vm:45316=
8kB, anon-rss:43644kB, file-rss:47644kB, shmem-rss:13476kB, UID:1000 pgtabl=
es:856kB oom_score_adj:300
[38617.509402] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.509805] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.510136] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.510464] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.510790] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.511144] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.511501] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.511829] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.516437] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.516825] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.517154] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.517482] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.517809] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.520822] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.521229] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.521556] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.521900] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.522226] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.522552] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.522879] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.523205] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.523531] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.523857] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.528444] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.528808] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.529136] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.529463] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.537359] oom_reaper: reaped process 8492 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:13488kB
[38617.540561] Xorg invoked oom-killer: gfp_mask=3D0x0(), order=3D0, oom_sc=
ore_adj=3D0
[38617.540572] CPU: 0 PID: 2978 Comm: Xorg Not tainted 5.7.0-rc5-next-20200=
515+ #117
[38617.540578] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW (2.19 )=
 03/31/2011
[38617.540583] Call Trace:
[38617.540596]  dump_stack+0x54/0x6e
[38617.540606]  dump_header+0x45/0x321
[38617.540613]  oom_kill_process.cold+0x9/0xe
[38617.540619]  ? out_of_memory+0x167/0x420
[38617.540626]  out_of_memory+0x1f2/0x420
[38617.540632]  pagefault_out_of_memory+0x34/0x56
[38617.540640]  mm_fault_error+0x4a/0x130
[38617.540646]  do_page_fault+0x3ce/0x416
[38617.540652]  ? vmalloc_sync_unmappings+0x10/0x10
[38617.540660]  common_exception_read_cr2+0x165/0x16a
[38617.540666] EIP: 0xb7e300a8
[38617.540674] Code: fc 83 fa 03 0f 8e e8 00 00 00 a8 0f 75 e4 83 fa 3f 7e =
a9 83 ea 40 89 c1 89 d6 c1 ee 06 8d 7e 01 c1 e7 06 8d 5c 3d 00 8d 76 00 <f3=
> 0f 6f 55 10 f3 0f 6f 4d 20 83 c5 40 83 c1 40 f3 0f 6f 45 f0 f3
[38617.540680] EAX: b6db1000 EBX: b6dab100 ECX: b6db1000 EDX: 000000d8
[38617.540685] ESI: 00000003 EDI: 00000100 EBP: b6dab000 ESP: bfc65030
[38617.540691] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00210206
[38617.540699]  ? bit_wait+0x1b/0x60
[38617.540705]  ? nmi+0xcc/0x2bc
[38617.540710] Mem-Info:
[38617.540721] active_anon:340835 inactive_anon:66363 isolated_anon:0
 active_file:19314 inactive_file:14829 isolated_file:0
 unevictable:782 dirty:231 writeback:21 unstable:0
 slab_reclaimable:6713 slab_unreclaimable:8701
 mapped:63130 shmem:41586 pagetables:6106 bounce:0
 free:286177 free_pcp:1271 free_cma:0
[38617.540730] Node 0 active_anon:1363340kB inactive_anon:265452kB active_f=
ile:77256kB inactive_file:59316kB unevictable:3128kB isolated(anon):0kB iso=
lated(file):0kB mapped:252520kB dirty:924kB writeback:84kB shmem:166344kB w=
riteback_tmp:0kB unstable:0kB all_unreclaimable? no
[38617.540741] DMA free:3116kB min:68kB low:84kB high:100kB reserved_highat=
omic:0KB active_anon:12344kB inactive_anon:0kB active_file:0kB inactive_fil=
e:0kB unevictable:0kB writepending:0kB present:15992kB managed:15916kB mloc=
ked:0kB kernel_stack:0kB pagetables:88kB bounce:0kB free_pcp:0kB local_pcp:=
0kB free_cma:0kB
[38617.540746] lowmem_reserve[]: 0 757 2934 757
[38617.540759] Normal free:178208kB min:3484kB low:4352kB high:5220kB reser=
ved_highatomic:0KB active_anon:474068kB inactive_anon:12876kB active_file:5=
104kB inactive_file:1928kB unevictable:0kB writepending:104kB present:89087=
2kB managed:776536kB mlocked:0kB kernel_stack:4592kB pagetables:24336kB bou=
nce:0kB free_pcp:2932kB local_pcp:1508kB free_cma:0kB
[38617.540764] lowmem_reserve[]: 0 0 17414 0
[38617.540776] HighMem free:963384kB min:512kB low:3012kB high:5512kB reser=
ved_highatomic:0KB active_anon:876936kB inactive_anon:252508kB active_file:=
72140kB inactive_file:57336kB unevictable:3128kB writepending:800kB present=
:2229064kB managed:2229064kB mlocked:48kB kernel_stack:0kB pagetables:0kB b=
ounce:0kB free_pcp:2140kB local_pcp:1292kB free_cma:0kB
[38617.540781] lowmem_reserve[]: 0 0 0 0
[38617.540789] DMA: 9*4kB (UM) 19*8kB (U) 17*16kB (UM) 13*32kB (UM) 15*64kB=
 (UM) 8*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3116kB
[38617.540810] Normal: 16643*4kB (UME) 8764*8kB (UME) 1782*16kB (UME) 84*32=
kB (UM) 162*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =
=3D 178252kB
[38617.540828] HighMem: 90491*4kB (UME) 45751*8kB (UME) 11773*16kB (UME) 10=
68*32kB (UME) 134*64kB (UME) 32*128kB (ME) 1*256kB (M) 0*512kB 0*1024kB 0*2=
048kB 0*4096kB =3D 963444kB
[38617.540848] 79590 total pagecache pages
[38617.540855] 3881 pages in swap cache
[38617.540861] Swap cache stats: add 272722, delete 268841, find 57108/87132
[38617.540866] Free swap  =3D 1715236kB
[38617.540870] Total swap =3D 2097148kB
[38617.540875] 783982 pages RAM
[38617.540880] 557266 pages HighMem/MovableOnly
[38617.540884] 28603 pages reserved
[38617.540889] Tasks state (memory values in pages):
[38617.540894] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swape=
nts oom_score_adj name
[38617.540913] [   2278]     0  2278     7323     4365    90112       44   =
          0 systemd-journal
[38617.540922] [   2501]     0  2501     3022      151    40960      267   =
      -1000 systemd-udevd
[38617.540932] [   2762]     0  2762     1484        0    45056       73   =
          0 rpcbind
[38617.540941] [   2775]   104  2775     1221       62    40960      120   =
          0 rpc.statd
[38617.540950] [   2789]     0  2789      805        5    36864       34   =
          0 rpc.idmapd
[38617.540960] [   2791]     0  2791     1410       75    40960       31   =
          0 bluetoothd
[38617.540969] [   2792]     0  2792    10524      145    81920      149   =
          0 accounts-daemon
[38617.540978] [   2793]     0  2793      935       24    40960       40   =
          0 atd
[38617.540987] [   2797]     0  2797    10615      327    77824      158   =
          0 ModemManager
[38617.540997] [   2798]     0  2798     1550       92    40960      138   =
          0 smartd
[38617.541006] [   2804]     0  2804    16578      752   114688      222   =
          0 NetworkManager
[38617.541015] [   2806]     0  2806     2094       63    45056       39   =
          0 cron
[38617.541025] [   2809]     0  2809     1697        3    45056       45   =
          0 irqbalance
[38617.541034] [   2813]     0  2813     1047       48    40960       46   =
          0 systemd-logind
[38617.541043] [   2814]     0  2814     1671      639    45056       25   =
          0 openvpn
[38617.541052] [   2849]   102  2849      958      139    36864       23   =
          0 avahi-daemon
[38617.541062] [   2853]   101  2853     1699      295    45056       63   =
       -900 dbus-daemon
[38617.541071] [   2865]     0  2865     1597       33    45056       32   =
          0 ofonod
[38617.541080] [   2889]   102  2889      958        6    36864       45   =
          0 avahi-daemon
[38617.541090] [   2911]     0  2911     8078      144    61440      168   =
          0 rsyslogd
[38617.541099] [   2917]     0  2917     3090        7    53248      136   =
          0 cups-browsed
[38617.541108] [   2926]   124  2926     5299       97    73728     1142   =
          0 timidity
[38617.541117] [   2928]     0  2928     2158      201    45056        0   =
      -1000 sshd
[38617.541127] [   2943]   111  2943    11822      419    90112      411   =
          0 colord
[38617.541136] [   2946]     0  2946     9660      234    73728      332   =
          0 polkitd
[38617.541145] [   2957]     0  2957     1241        0    40960       33   =
          0 agetty
[38617.541154] [   2968]     0  2968    11493      113    73728      102   =
          0 lightdm
[38617.541163] [   2978]     0  2978    19709     3585   139264     1458   =
          0 Xorg
[38617.541172] [   3260]   107  3260     1335       46    40960       61   =
          0 systemd
[38617.541181] [   3263]   107  3263     6320       87    57344      318   =
          0 (sd-pam)
[38617.541190] [   3277]   107  3277     1138        0    40960       65   =
          0 dbus-launch
[38617.541200] [   3282]   107  3282     1460       67    40960       69   =
          0 dbus-daemon
[38617.541209] [   3292]     0  3292     2055      205    45056       43   =
          0 wpa_supplicant
[38617.541218] [   3294]   107  3294     7194       26    65536       98   =
          0 at-spi2-registr
[38617.541227] [   3304]     0  3304     7395      135    65536      215   =
          0 lightdm
[38617.541237] [   3315]  1000  3315     1335       46    40960       59   =
          0 systemd
[38617.541246] [   3318]  1000  3318     6320      100    57344      306   =
          0 (sd-pam)
[38617.541254] [   3322]  1000  3322    15781      505    94208      385   =
          0 gnome-keyring-d
[38617.541263] [   3325]  1000  3325    14377      440   110592      283   =
          0 mate-session
[38617.541272] [   3350]  1000  3350     1183       10    40960       44   =
          0 ssh-agent
[38617.541281] [   3353]  1000  3353     1138        0    40960       65   =
          0 dbus-launch
[38617.541290] [   3354]  1000  3354     1584      346    40960       49   =
          0 dbus-daemon
[38617.541298] [   3359]  1000  3359     6710      137    53248      255   =
          0 dconf-service
[38617.541307] [   3366]  1000  3366    45425        2   167936      755   =
          0 mate-settings-d
[38617.541316] [   3367]  1000  3367    26073     2398   151552      358   =
          0 marco
[38617.541325] [   3374]  1000  3374    22371      981   135168      470   =
          0 mate-panel
[38617.541334] [   3376]  1000  3376    11608      143    90112      166   =
          0 gvfsd
[38617.541342] [   3395]  1000  3395    25518      667   155648      540   =
          0 caja
[38617.541351] [   3400]  1000  3400    10469      159   110592     1510   =
          0 applet.py
[38617.541360] [   3403]  1000  3403    18027     1515   122880      304   =
          0 wnck-applet
[38617.541368] [   3406]  1000  3406    11247      299   126976     1534   =
          0 smart-notifier
[38617.541377] [   3407]  1000  3407    11674      221    98304      238   =
          0 polkit-mate-aut
[38617.541386] [   3415]  1000  3415    11982      176    86016      133   =
          0 gvfs-udisks2-vo
[38617.541395] [   3416]  1000  3416    30735      972   122880      349   =
          0 mate-volume-con
[38617.541404] [   3419]     0  3419    13806      478    77824      179   =
          0 udisksd
[38617.541412] [   3420]  1000  3420    15365      353   114688      284   =
          0 mate-screensave
[38617.541421] [   3426]  1000  3426    22941     1403   151552      568   =
          0 nm-applet
[38617.541430] [   3427]  1000  3427    20721     1119   131072      398   =
          0 mate-power-mana
[38617.541439] [   3434]  1000  3434    26376     1088   159744      246   =
          0 pulseaudio
[38617.541447] [   3440]  1000  3440    21560      144   122880      275   =
          0 zeitgeist-datah
[38617.541456] [   3443]  1000  3443    14521        0    90112      225   =
          0 gvfs-afc-volume
[38617.541465] [   3453]  1000  3453    11293       29    81920      110   =
          0 gvfs-mtp-volume
[38617.541474] [   3458]  1000  3458    11423       94    65536      156   =
          0 at-spi-bus-laun
[38617.541483] [   3465]  1000  3465    11337       43    77824      158   =
          0 gvfs-goa-volume
[38617.541492] [   3469]  1000  3469     1433       38    40960       57   =
          0 dbus-daemon
[38617.541501] [   3475]  1000  3475    36798       57   167936      810   =
          0 goa-daemon
[38617.541510] [   3478]  1000  3478    14917      129    86016      237   =
          0 zeitgeist-daemo
[38617.541519] [   3482]     0  3482     8420       94    69632      104   =
          0 console-kit-dae
[38617.541527] [   3484]  1000  3484     7194       13    65536       98   =
          0 at-spi2-registr
[38617.541536] [   3488]  1000  3488    13764        0    94208      187   =
          0 gvfsd-trash
[38617.541545] [   3562]  1000  3562    18544       56   122880      487   =
          0 zeitgeist-fts
[38617.541554] [   3578]     0  3578    12257      127    86016      111   =
          0 upowerd
[38617.541563] [   3581]  1000  3581     1744        0    45056       16   =
          0 cat
[38617.541571] [   3595]  1000  3595    11510      166    77824      148   =
          0 gvfs-gphoto2-vo
[38617.541580] [   3599]  1000  3599     3405      198    57344      129   =
          0 gconfd-2
[38617.541589] [   3616]  1000  3616    16632     1140   114688      291   =
          0 command-applet
[38617.541598] [   3621]  1000  3621    13930      548   102400      332   =
          0 notification-ar
[38617.541607] [   3622]  1000  3622    14880      945   110592      288   =
          0 mate-inhibit-ap
[38617.541615] [   3641]  1000  3641     2079       81    49152       88   =
          0 xfconfd
[38617.541624] [   3757]  1000  3757    22119     1403   151552      421   =
          0 mate-terminal
[38617.541633] [   3763]  1000  3763      670       68    36864       31   =
          0 gnome-pty-helpe
[38617.541642] [   3764]  1000  3764     2565      449    49152      361   =
          0 bash
[38617.541651] [   4046]  1000  4046      620        1    36864       15   =
          0 start-pulseaudi
[38617.541659] [   4047]  1000  4047     3747      992    61440      452   =
          0 xprop
[38617.541668] [   4336]  1000  4336    22635     2117   151552      632   =
          0 mate-terminal
[38617.541677] [   4341]  1000  4341      670       60    36864       31   =
          0 gnome-pty-helpe
[38617.541686] [   4342]  1000  4342     2607      197    49152      425   =
          0 bash
[38617.541695] [   4439]  1000  4439    11055     1208   102400      294   =
          0 gkrellm
[38617.541704] [   4466]  1000  4466     2569      457    49152      362   =
          0 bash
[38617.541712] [   4507]  1000  4507     2575      640    49152      279   =
          0 bash
[38617.541721] [   4558]  1000  4558     2577      419    49152      394   =
          0 bash
[38617.541730] [   4990]  1000  4990     2567       38    49152      433   =
          0 bash
[38617.541739] [   5041]  1000  5041     2569      573    49152      216   =
          0 bash
[38617.541747] [   5341]  1000  5341     2563      137    49152      401   =
          0 bash
[38617.541756] [   5613]  1000  5613     2555       79    49152      446   =
          0 bash
[38617.541765] [   5619]  1000  5619     2082       66    45056       41   =
          0 tmpchromium
[38617.541774] [   5632]  1000  5632   330018    50888  1785856     2508   =
          0 chromium
[38617.541783] [   5638]  1000  5638    53234     1098   286720      528   =
          0 chromium
[38617.541792] [   5700]  1000  5700    86379     4186   573440      684   =
        300 chromium
[38617.541801] [   5796]  1000  5796   150075    14626  1253376     8888   =
        300 chromium
[38617.541812] [   6939]  1000  6939   117568     3477   974848    15646   =
        300 chromium
[38617.541822] [  14032]  1000 14032   128197    22248   962560      480   =
        300 chromium
[38617.541833] [  14915]  1000 14915   105049     5732   761856     7736   =
        300 chromium
[38617.541843] [  14959]  1000 14959    96816     3137   720896     5115   =
        300 chromium
[38617.541852] [  15866]  1000 15866     2081      105    45056        0   =
          0 e
[38617.541860] [  15868]  1000 15868    16769     1425   135168        1   =
          0 emacs
[38617.541869] [  15889]  1000 15889    96560     7486   700416      590   =
        300 chromium
[38617.541878] [  15951]  1000 15951   108112    15194   823296     1491   =
        300 chromium
[38617.541887] [  11060]  1000 11060   104396     8181   786432     5449   =
        300 chromium
[38617.541895] [  23950]  1000 23950   113414    18911   884736      540   =
        300 chromium
[38617.541904] [  24414]  1000 24414   108973     6468   811008     8447   =
        300 chromium
[38617.541914] [  32542]  1000 32542   116749    16072   937984      490   =
        300 chromium
[38617.541923] [    624]     0   624     1163      139    40960        0   =
          0 inetd
[38617.541932] [   1610]  1000  1610   115661    17507   933888      490   =
        300 chromium
[38617.541941] [   2599]     0  2599     4571      448    69632        0   =
          0 cupsd
[38617.541952] [   4388]  1000  4388    95412     7419   655360      486   =
        300 chromium
[38617.541961] [   6854]  1000  6854    96563     8793   720896     3446   =
        300 chromium
[38617.541971] [   8219]  1000  8219     2081      515    45056        0   =
          0 e
[38617.541979] [   8220]  1000  8220    16773     2804   139264        0   =
          0 emacs
[38617.541991] [   8753]  1000  8753    94857    19848   696320      482   =
        300 chromium
[38617.542000] [   9774]  1000  9774     2082      525    45056        0   =
          0 e
[38617.542009] [   9775]  1000  9775    16780     2783   139264        0   =
          0 emacs
[38617.542019] [  11556]  1000 11556    91394    17315   651264      486   =
        300 chromium
[38617.542028] [  11576]  1000 11576    91260    17798   647168      481   =
        300 chromium
[38617.542037] [  11638]  1000 11638     2081      531    45056        0   =
          0 unis
[38617.542046] [  11639]  1000 11639     2081      530    45056        0   =
          0 long
[38617.542055] [  11642]  1000 11642   193995   187395  1568768        0   =
          0 unison
[38617.542064] [  11643]  1000 11643     2017      602    45056        0   =
          0 ssh
[38617.542071] oom-kill:constraint=3DCONSTRAINT_NONE,nodemask=3D(null),task=
=3Dchromium,pid=3D5796,uid=3D1000
[38617.542152] Out of memory: Killed process 5796 (chromium) total-vm:60030=
0kB, anon-rss:53300kB, file-rss:3652kB, shmem-rss:1552kB, UID:1000 pgtables=
:1224kB oom_score_adj:300
[38617.542258] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.542440] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.542594] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.542749] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.542903] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543057] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543210] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543364] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543519] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543684] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.543839] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.547296] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.547513] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.547668] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.547823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.548478] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.548637] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.548792] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.548945] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549100] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549303] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549458] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549618] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549772] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.549926] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550081] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550234] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550389] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550543] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550697] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.550851] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551005] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551185] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551495] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551649] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.551803] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.560065] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.560326] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.560482] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.560638] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.560845] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561000] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561177] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561366] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561521] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561675] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561830] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.561984] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562327] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562481] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562635] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562789] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.562943] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.563197] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.563351] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.563506] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.563694] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.563849] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.572243] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.572594] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.572874] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.573154] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.573434] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.573713] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.573993] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.574272] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.574551] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.574830] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.575109] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.575388] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.575667] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.580089] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.580510] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.580792] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.581087] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.581399] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.581678] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.581957] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.582235] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.582513] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.582791] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.583070] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.583348] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.583647] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.583925] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.588462] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.588744] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.589024] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.589305] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.589585] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.589865] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.590145] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.590425] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.590705] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.590986] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.591303] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.591584] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.591864] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.592709] oom_reaper: reaped process 5796 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:1568kB
[38617.595840] Out of memory: Killed process 14032 (chromium) total-vm:5127=
88kB, anon-rss:56568kB, file-rss:3804kB, shmem-rss:28620kB, UID:1000 pgtabl=
es:940kB oom_score_adj:300
[38617.604119] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.604553] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.604839] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.605122] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.605424] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.605708] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.605991] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.606378] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.606660] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.606941] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.607224] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.607505] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.607785] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.618743] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.619095] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.619377] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.619658] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.620492] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.620785] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.621067] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.621459] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.621741] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.622022] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.622303] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.622583] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.622863] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.623144] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.623424] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.623704] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.625992] oom_reaper: reaped process 14032 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:28632kB
[38617.628190] Out of memory: Killed process 8753 (chromium) total-vm:37942=
8kB, anon-rss:33776kB, file-rss:44236kB, shmem-rss:1380kB, UID:1000 pgtable=
s:680kB oom_score_adj:300
[38617.628326] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.628688] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.629008] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.629328] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.629647] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.629974] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.630361] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.630683] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.631002] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.631353] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.631673] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.649672] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.649957] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.650136] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.650312] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.650490] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.650667] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.650844] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.651020] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.651225] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.651404] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.651581] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.651758] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.656000] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.656343] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.656523] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.656701] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.656881] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657069] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657247] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657424] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657602] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657780] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.657959] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.658201] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.658381] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.658558] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.658737] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.658913] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.659091] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.659268] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.659446] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.659623] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.659800] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.662194] oom_reaper: reaped process 8753 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:1300kB
[38617.665756] Out of memory: Killed process 23950 (chromium) total-vm:4536=
56kB, anon-rss:59012kB, file-rss:4120kB, shmem-rss:12512kB, UID:1000 pgtabl=
es:864kB oom_score_adj:300
[38617.665882] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666109] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666283] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666447] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666611] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666784] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.666948] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.667151] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.667316] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.672465] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.672703] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.672869] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673035] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673201] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673366] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673572] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673739] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.673904] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674070] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674235] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674401] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674566] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674732] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.674897] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675227] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675393] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675558] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675723] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.675888] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.687803] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.696029] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.696730] Out of memory: Killed process 6939 (chromium) total-vm:47027=
2kB, anon-rss:10076kB, file-rss:3624kB, shmem-rss:208kB, UID:1000 pgtables:=
952kB oom_score_adj:300
[38617.696925] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.697214] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.697494] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.697772] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.698051] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.698330] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.698608] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.698887] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.699165] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.699444] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.699784] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.701700] oom_reaper: reaped process 23950 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:12552kB
[38617.708271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.708720] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.709000] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.709280] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.709559] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.709893] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.710172] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.710450] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.710728] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.711006] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.711318] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.711596] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.711874] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.717406] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.717716] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.717994] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.718272] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.718550] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.725208] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.725494] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.725775] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.726142] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.726437] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.726715] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.726994] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.727272] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.727549] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.727827] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.736272] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.736590] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.736868] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.737146] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.737424] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.737702] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.737979] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.738256] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.738537] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.738831] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.739111] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.739405] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.739700] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.748089] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.748452] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.748731] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.749009] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.749286] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.749564] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.749842] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.750119] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.750397] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.750675] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.751008] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.768108] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.768313] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.768569] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.768723] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.768880] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769034] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769188] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769343] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769498] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769696] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.769851] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770006] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770160] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770479] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770635] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.770978] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.771157] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.771313] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.771467] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.771621] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.771776] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.774585] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.774867] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775023] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775178] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775333] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775543] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775701] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.775855] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.776526] oom_reaper: reaped process 6939 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:220kB
[38617.776750] Out of memory: Killed process 11576 (chromium) total-vm:3650=
40kB, anon-rss:14332kB, file-rss:46736kB, shmem-rss:10124kB, UID:1000 pgtab=
les:632kB oom_score_adj:300
[38617.776859] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777051] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777231] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777410] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777626] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777805] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.777983] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.778162] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.778340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.778518] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.778696] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.778874] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.779053] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.779267] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.779448] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.779664] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.779845] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.787595] oom_reaper: reaped process 11576 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:10024kB
[38617.796543] Out of memory: Killed process 1610 (chromium) total-vm:46264=
4kB, anon-rss:66004kB, file-rss:3604kB, shmem-rss:420kB, UID:1000 pgtables:=
912kB oom_score_adj:300
[38617.796820] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.797167] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.797471] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.797776] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.798079] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.798382] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.798706] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.799010] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.799313] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.799616] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.799920] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.808748] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.809061] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.809363] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.809665] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.809967] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.810271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.810574] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.810876] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.811218] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.811521] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.811824] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.819746] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.824316] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.824677] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.824979] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.825280] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.825582] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.825883] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.826217] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.826519] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.826819] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.827121] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.827422] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.827724] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.836159] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.836568] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.836871] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.837173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.837474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.837776] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.838078] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.838379] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.838681] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.838983] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.839287] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.839589] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.839891] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.848551] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.848881] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.849186] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.849488] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.849789] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.850090] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.850392] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.850693] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.850994] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.851331] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.851633] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.854706] oom_reaper: reaped process 1610 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:556kB
[38617.854743] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.855297] Out of memory: Killed process 11556 (chromium) total-vm:3655=
76kB, anon-rss:21240kB, file-rss:45128kB, shmem-rss:2892kB, UID:1000 pgtabl=
es:636kB oom_score_adj:300
[38617.855405] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.855732] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.864307] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.870023] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.872423] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.872740] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.872917] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873093] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873269] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873448] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873625] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873800] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.873976] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.874152] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.874328] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.874505] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.874681] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.874857] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875032] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875208] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875386] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875562] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875737] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.875913] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.879077] Out of memory: Killed process 15951 (chromium) total-vm:4324=
48kB, anon-rss:33832kB, file-rss:3640kB, shmem-rss:23304kB, UID:1000 pgtabl=
es:804kB oom_score_adj:300
[38617.879198] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.879376] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.879536] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.879708] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.879869] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.880917] oom_reaper: reaped process 11556 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:2916kB
[38617.884511] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.884718] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.884880] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885041] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885203] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885364] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885533] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.885856] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886079] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886262] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886432] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886592] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886753] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.886912] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.887072] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.887232] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.887393] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.887588] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.887750] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.894455] oom_reaper: reaped process 15951 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:23308kB
[38617.894532] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.894888] Out of memory: Killed process 32542 (chromium) total-vm:4669=
96kB, anon-rss:60476kB, file-rss:3580kB, shmem-rss:232kB, UID:1000 pgtables=
:916kB oom_score_adj:300
[38617.894989] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.895171] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.895334] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.895498] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.895660] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.895823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.896428] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.896600] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.896869] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897085] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897249] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897412] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897575] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897738] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.897901] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898064] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898228] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898391] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898554] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898717] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.898880] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899044] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899207] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899371] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899534] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899697] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.899860] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.916498] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.916978] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.917281] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.917580] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.917878] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.918176] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.918474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.918770] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.919068] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.919641] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.920523] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.920832] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.921151] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.921469] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.921766] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.922062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.922360] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.922718] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.923013] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.923311] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.923606] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.923900] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.936487] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.936805] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.937105] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.937403] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.937700] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.937997] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.938294] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.938590] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.938898] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.939201] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.939500] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.939814] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.944356] Out of memory: Killed process 24414 (chromium) total-vm:4358=
92kB, anon-rss:14796kB, file-rss:3732kB, shmem-rss:7344kB, UID:1000 pgtable=
s:792kB oom_score_adj:300
[38617.944518] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.944841] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.945134] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.945427] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.945719] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.946011] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.946341] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.946635] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.946927] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.947219] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.947512] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.947804] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.952650] oom_reaper: reaped process 32542 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:168kB
[38617.956836] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.957193] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.957490] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.957785] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.958080] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.958376] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.958671] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.958967] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.959263] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.959559] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.959855] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.968411] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.968745] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.969039] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.969332] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.969625] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.969918] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.970210] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.970503] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.970797] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.971090] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.971429] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.971724] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.987130] oom_reaper: reaped process 24414 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:7376kB
[38617.987326] Out of memory: Killed process 11060 (chromium) total-vm:4175=
84kB, anon-rss:18292kB, file-rss:3652kB, shmem-rss:10780kB, UID:1000 pgtabl=
es:768kB oom_score_adj:300
[38617.987471] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.987685] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.987846] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.992219] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.992449] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.992661] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.992823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.992984] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993145] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993307] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993467] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993628] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993788] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.993949] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994110] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994432] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994593] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994755] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.994918] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995079] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995241] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995404] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995566] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995727] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.995890] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.998369] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.998558] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.998718] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.998878] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999039] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999200] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999360] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999521] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999686] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38617.999880] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.004362] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.004574] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.004737] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.004901] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005063] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005225] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005388] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005550] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005714] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.005876] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006040] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006239] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006403] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006566] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006729] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.006891] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007055] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007218] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007382] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007547] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007713] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.007877] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.020250] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.020591] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.020885] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.021213] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.021506] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.021881] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.022173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.022463] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.022752] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.023042] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.023384] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.023675] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.028240] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.028673] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.028968] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.029261] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.029552] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.029844] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.030137] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.030429] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.030722] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.031013] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.031348] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.031643] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.035802] oom_reaper: reaped process 11060 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:10828kB
[38618.040020] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.040538] Out of memory: Killed process 14915 (chromium) total-vm:4201=
96kB, anon-rss:11848kB, file-rss:3772kB, shmem-rss:7308kB, UID:1000 pgtable=
s:744kB oom_score_adj:300
[38618.040677] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.040960] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.041270] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.041549] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.041827] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.042105] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.042384] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.042662] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.042941] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.043218] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.043571] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.043850] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.059573] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.059892] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.060711] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.060996] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.061319] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.061601] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.061883] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.062164] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.062446] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.062727] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.063008] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.063289] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.063570] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.063851] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.064828] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.065113] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.065392] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.065669] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.065947] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.066273] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.066552] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.066831] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.067110] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.067388] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.067666] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.077397] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.077820] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.078101] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.078380] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.078658] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.078936] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.079214] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.079491] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.079769] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.080734] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.081027] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.081344] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.081624] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.081903] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.082183] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.082463] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.082742] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.083021] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.083301] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.083582] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.083863] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.092266] oom_reaper: reaped process 14915 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:7360kB
[38618.092654] Out of memory: Killed process 6854 (chromium) total-vm:38625=
2kB, anon-rss:14264kB, file-rss:18688kB, shmem-rss:2220kB, UID:1000 pgtable=
s:704kB oom_score_adj:300
[38618.096414] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.096685] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.096850] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097014] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097178] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097342] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097505] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097669] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097834] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.097998] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.098161] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.098398] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.098565] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.098729] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.098892] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099055] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099219] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099416] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099581] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099745] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.099908] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.106693] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.106891] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107056] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107220] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107383] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107546] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107709] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.107872] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.110874] oom_reaper: reaped process 6854 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:2352kB
[38618.111166] Out of memory: Killed process 14959 (chromium) total-vm:3872=
64kB, anon-rss:9300kB, file-rss:3080kB, shmem-rss:168kB, UID:1000 pgtables:=
704kB oom_score_adj:300
[38618.111289] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.111482] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.111638] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.111793] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.114913] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.115160] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.115315] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.115471] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.115626] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.115782] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.120148] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.120440] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.120598] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.120754] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.120911] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121066] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121246] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121403] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121559] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121715] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.121871] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122027] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122183] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122496] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122653] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122809] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.122966] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.123125] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.123282] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.136403] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.136729] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.137011] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.137292] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.137572] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.137852] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.138133] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.138413] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.138711] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.138992] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.139274] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.139555] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.139836] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.141016] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.141340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.141687] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.141967] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.142246] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.142525] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.142804] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.143083] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.143361] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.143639] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.143918] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.146250] oom_reaper: reaped process 14959 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:68kB
[38618.149107] Out of memory: Killed process 15889 (chromium) total-vm:3862=
40kB, anon-rss:26156kB, file-rss:3728kB, shmem-rss:60kB, UID:1000 pgtables:=
684kB oom_score_adj:300
[38618.149249] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.149540] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.149823] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.150108] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.150392] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.150676] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.150960] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.151287] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.151574] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.151859] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.163378] Out of memory: Killed process 4388 (chromium) total-vm:38164=
8kB, anon-rss:15020kB, file-rss:13780kB, shmem-rss:876kB, UID:1000 pgtables=
:640kB oom_score_adj:300
[38618.163540] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.163851] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.164674] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.164973] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.165264] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.165555] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.165845] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.166154] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.166466] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.166759] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.167049] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.167340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.167632] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.167923] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.171500] oom_reaper: reaped process 15889 (chromium), now anon-rss:0k=
B, file-rss:0kB, shmem-rss:40kB
[38618.173178] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.173547] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.173836] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.174124] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.174462] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.174751] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.175038] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.175326] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.175613] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.175900] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.188517] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.188892] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.189182] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.189471] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.189760] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.190192] Out of memory: Killed process 5700 (chromium) total-vm:34551=
6kB, anon-rss:10524kB, file-rss:6120kB, shmem-rss:100kB, UID:1000 pgtables:=
560kB oom_score_adj:300
[38618.190276] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.190556] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.190832] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.191124] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.191415] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.191691] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.192931] oom_reaper: reaped process 4388 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:816kB
[38618.196447] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.196847] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.197129] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.197407] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.197684] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.197962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.198239] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.198516] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.198795] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.199142] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.199419] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.199695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.206727] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.206973] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207131] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207286] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207441] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207595] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207750] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.207906] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.211305] oom_reaper: reaped process 5700 (chromium), now anon-rss:0kB=
, file-rss:0kB, shmem-rss:0kB
[38618.211643] Out of memory: Killed process 11642 (unison) total-vm:559080=
kB, anon-rss:535052kB, file-rss:6852kB, shmem-rss:0kB, UID:1000 pgtables:11=
24kB oom_score_adj:0
[38618.211771] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.220097] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.220524] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.220692] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.220858] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221024] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221219] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221385] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221553] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221719] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.221885] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222092] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222259] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222427] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222594] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.222929] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223096] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223262] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223428] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223594] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223760] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.223926] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.227729] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.227901] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.232166] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.232356] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.232524] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.232756] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.232924] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233090] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233256] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233422] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233588] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233754] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.233920] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234087] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234253] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234419] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234586] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234752] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.234918] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235083] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235250] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235415] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235581] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235747] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.235912] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.252537] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.252879] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.253188] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.253490] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.253792] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.254094] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.254396] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.254699] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.255001] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.255303] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.255622] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.255925] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.257030] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.257334] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.257636] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.257939] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.258241] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.258543] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.258845] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.264200] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.264605] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.264906] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.265206] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.265506] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.265806] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.266122] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.266437] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.266757] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.267056] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.267356] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.267656] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.276093] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.276551] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.276855] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.277158] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.277459] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.277759] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.278059] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.278360] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.278660] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.278961] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.279334] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.279638] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.284220] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.284601] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.284903] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.285206] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.285578] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.285879] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.286215] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.286515] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.286816] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.287171] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.287473] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.287772] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.300352] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.300801] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.301132] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.301451] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.301754] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.302057] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.302359] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.302661] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.302963] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.303264] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.303567] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.303868] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.308620] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.308957] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.309260] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.315821] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.316520] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.316736] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.316906] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317073] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317240] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317408] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317609] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317775] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.317940] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.318106] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.318271] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.318437] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.318603] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.318802] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319000] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319166] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319332] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319497] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319663] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.319829] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.328257] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.328577] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.328750] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.328916] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329085] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329251] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329417] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329582] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329748] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.329914] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330082] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330287] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330457] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330627] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330794] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.330962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.331171] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.331340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.331508] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.331676] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.331844] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.336297] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.336528] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.336695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.336861] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337027] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337193] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337359] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337526] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337693] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.337915] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338082] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338249] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338415] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338581] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338748] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.338914] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339080] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339246] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339412] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339579] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339745] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.339911] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.348474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.348695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.348870] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.349041] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.349218] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.349389] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.349561] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.353966] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.354357] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.354659] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.354959] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.355260] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.355560] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.355860] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.364499] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.364860] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.365166] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.365474] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.365780] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.366083] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.366604] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.366909] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.367215] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.367516] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.367817] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.368843] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.369154] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.369458] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.369760] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.370062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.370364] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.370666] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.370981] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.371410] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.371713] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.372547] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.372857] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.373160] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.373461] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.373762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.374062] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.374362] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.374662] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.374962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.375262] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.375561] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.375861] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.382895] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.383276] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.383586] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.383894] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.385129] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.385454] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.385762] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.386069] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.386427] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.386732] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.387037] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.387342] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.387646] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.404039] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.404504] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.404807] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.405109] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.405413] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.405713] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.406013] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.406364] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.406665] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.406966] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.407266] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.407567] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.407867] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.416431] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.416769] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.417072] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.417375] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.417678] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.417981] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.418361] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.418672] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.418980] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.419285] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.419586] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.419890] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.436465] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.436671] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.436839] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437006] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437343] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437573] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437741] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.437907] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438076] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438241] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438418] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438585] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438790] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.438957] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.439122] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.439289] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.439454] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.439620] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.439786] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.448139] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.448504] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.448673] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.448839] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449006] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449172] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449340] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449508] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449735] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.449907] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450077] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450245] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450414] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450584] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450754] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.450925] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.451123] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.451324] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.451500] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.451674] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.451849] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.459904] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.460405] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.460588] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.460755] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.460924] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461114] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461291] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461458] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461625] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461792] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.461962] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.462186] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.462361] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.462530] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.462698] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.462866] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463033] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463201] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463368] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463536] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463704] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.463875] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.472729] oom_reaper: reaped process 11642 (unison), now anon-rss:0kB,=
 file-rss:0kB, shmem-rss:0kB
[38618.473359] Out of memory: Killed process 5632 (chromium) total-vm:11150=
72kB, anon-rss:138176kB, file-rss:45288kB, shmem-rss:19952kB, UID:1000 pgta=
bles:1532kB oom_score_adj:0
[38618.473519] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.473819] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.474091] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.474363] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.474639] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.474910] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.475181] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.475452] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.475723] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.485655] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.486029] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.486338] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.486611] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.486883] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.487154] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.492049] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.493304] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.493695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.494054] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.494739] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.495818] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.496686] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.498944] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.499254] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.499532] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.499808] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.504742] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.509433] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.510562] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.510838] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.511136] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.516382] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.516907] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.517224] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.517573] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.518101] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.518375] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.518746] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.519020] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.520702] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.522414] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.522868] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.523189] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.523501] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.528118] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.528624] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.529009] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.529325] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.529600] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.529873] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.532695] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.533060] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.533336] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.533609] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.533884] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.534159] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.534433] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.534706] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.534980] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.535253] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.535527] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.544871] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545111] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545282] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545486] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545641] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545793] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.545990] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.546173] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.546328] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.546526] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.546679] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.546868] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547018] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547168] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547318] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547468] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547619] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547770] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.547922] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.552349] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.552516] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.552671] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.552880] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.553098] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.553250] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.553402] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.553591] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.556495] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.556719] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.556870] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557021] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557172] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557323] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557475] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557626] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557777] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.557929] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558080] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558231] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558382] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558533] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558685] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558836] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.558987] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559140] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559292] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559444] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559595] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559746] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.559897] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.568334] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.568527] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.568681] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.568835] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.568989] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569142] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569297] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569451] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569602] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569753] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.569904] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.570054] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.570205] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.570356] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.570507] Purging GPU memory, 0 pages freed, 0 pages still pinned, 768=
 pages left available.
[38618.570678] Out of memory: Killed process 2978 (Xorg) total-vm:78836kB, =
anon-rss:7132kB, file-rss:3540kB, shmem-rss:3668kB, UID:0 pgtables:136kB oo=
m_score_adj:0
[38618.572581] oom_reaper: reaped process 5632 (chromium), now anon-rss:0kB=
, file-rss:8480kB, shmem-rss:19984kB
[38618.574189] oom_reaper: reaped process 2978 (Xorg), now anon-rss:0kB, fi=
le-rss:0kB, shmem-rss:3668kB
[38625.892480] wlan0: deauthenticating from 5c:f4:ab:10:d2:bb by local choi=
ce (Reason: 3=3DDEAUTH_LEAVING)
[38648.021964] traps: mateweather-app[11961] trap int3 ip:b72a5fc0 sp:bf9d7=
d20 error:0 in libglib-2.0.so.0.5000.3[b7259000+12a000]
[38648.048780] traps: clock-applet[11958] trap int3 ip:b71fbfc0 sp:bfae5ec0=
 error:0 in libglib-2.0.so.0.5000.3[b71af000+12a000]
[38649.822054] wlan0: authenticate with 5c:f4:ab:10:d2:bb
[38649.822241] wlan0: send auth to 5c:f4:ab:10:d2:bb (try 1/3)
[38649.824240] wlan0: authenticated
[38649.828055] wlan0: associate with 5c:f4:ab:10:d2:bb (try 1/3)
[38649.830814] wlan0: RX AssocResp from 5c:f4:ab:10:d2:bb (capab=3D0x411 st=
atus=3D0 aid=3D1)
[38649.832448] wlan0: associated

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7M3R4ACgkQMOfwapXb+vIsmwCeMPZmjX8TDYWjaCYAuD3nYRzZ
fLkAoJ9IcnD0Coou5n/86nDErt+HPKtH
=up1m
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============0078704159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0078704159==--
