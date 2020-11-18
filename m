Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240272B84FA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 20:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29089A4F;
	Wed, 18 Nov 2020 19:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71389A4F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 19:36:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1D45BDF3;
 Wed, 18 Nov 2020 19:36:36 +0000 (UTC)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
 <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Linux 5.10-rc4
Message-ID: <0a10da3d-085f-c7a7-0053-dc1e9ea871ed@suse.de>
Date: Wed, 18 Nov 2020 20:36:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray" <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2021189817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2021189817==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Jf4dsdD9FpIUnAu4WSYX3IOo5BfSgA5BY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Jf4dsdD9FpIUnAu4WSYX3IOo5BfSgA5BY
Content-Type: multipart/mixed; boundary="EPGgNqXdka1hEfB5qZbUEH7bZuwTCTGTJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Huang, Ray" <ray.huang@amd.com>
Message-ID: <0a10da3d-085f-c7a7-0053-dc1e9ea871ed@suse.de>
Subject: Re: Linux 5.10-rc4
References: <CAHk-=wjFfAktnadOPb_iV5nKh=V5Am1sG-gciYveswRtuEkrLQ@mail.gmail.com>
 <692820a49ded436591b5fe3a18c68a5e@AcuMS.aculab.com>
 <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>
In-Reply-To: <CAHk-=wgQY7k_3NVCbaSmiJyLiAV_1TgwLk-d4QRMHMWqM5Oo_w@mail.gmail.com>

--EPGgNqXdka1hEfB5qZbUEH7bZuwTCTGTJ
Content-Type: multipart/mixed;
 boundary="------------B3174847DA33255D6E13AF17"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B3174847DA33255D6E13AF17
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.11.20 um 19:10 schrieb Linus Torvalds:
> On Wed, Nov 18, 2020 at 4:12 AM David Laight <David.Laight@aculab.com> =
wrote:
>>
>> I've got the 'splat' below during boot.
>> This is an 8-core C2758 Atom cpu using the on-board/cpu graphics.
>> User space is Ubuntu 20.04.
>>
>> Additionally the X display has all the colours and alignment slightly
>> messed up.
>> 5.9.0 was ok.
>> I'm just guessing the two issues are related.
>=20
> Sounds likely.  But it would be lovely if you could bisect when
> exactly the problem(s) started to both verify that, and just to
> pinpoint the exact change..
>=20
> I'm adding Thomas Zimmermann to the cc, because he did that "drm/ast:
> Program display mode in CRTC's atomic_enable" which looks relevant in
> that it's right in that call-chain.
>=20
> Did some initialization perhaps get overlooked?
>=20
> And Dave and Daniel and the drm list cc'd as well..
>=20
> Full splat left quoted below for new people and list.
>=20
>              Linus
>=20
>> [   20.809891] WARNING: CPU: 0 PID: 973 at drivers/gpu/drm/drm_gem_vra=
m_helper.c:284 drm_gem_vram_offset+0x35/0x40 [drm_vram_helper]

That line is at [1], which comes from

  46642a7d4d80 ("drm/vram-helper: don't use ttm bo->offset v4")

But the patch was merged in 5.9-rc1, so it's probably something else.

We've had a lot of TTM-related changes recently, so my best guess is=20
that it's something in TTM with BO initialization.

 From some grepping, it looks like we have to call ttm_bo_mem_space() to =

fill mm_node (i.e., the pointer that causes the warning). But I cannot=20
find where vram helpers do this. Maybe that's a good starting point.

I'm adding the TTM devs to cc.

Best regards
Thomas

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/drm_gem_vram_helper.c?h=3Dv5.10-rc4#n284


>> [   20.821543] Modules linked in: nls_iso8859_1 dm_multipath scsi_dh_r=
dac scsi_dh_emc scsi_dh_alua ipmi_ssif intel_powerclamp coretemp kvm_inte=
l kvm joydev input_leds ipmi_si intel_cstate ipmi_devintf ipmi_msghandler=
 mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables auto=
fs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov =
async_memcpy async_pq async_xor async_tx libcrc32c xor raid6_pq raid1 rai=
d0 multipath linear ast drm_vram_helper drm_kms_helper syscopyarea sysfil=
lrect sysimgblt fb_sys_fops cec drm_ttm_helper ttm crct10dif_pclmul crc32=
_pclmul ghash_clmulni_intel gpio_ich drm aesni_intel hid_generic glue_hel=
per crypto_simd igb usbhid cryptd ahci i2c_i801 hid libahci i2c_smbus lpc=
_ich dca i2c_ismt i2c_algo_bit
>> [   20.887477] CPU: 0 PID: 973 Comm: gnome-shell Not tainted 5.10.0-rc=
4+ #78
>> [   20.894274] Hardware name: Supermicro A1SAi/A1SRi, BIOS 1.1a 08/27/=
2015
>> [   20.900896] RIP: 0010:drm_gem_vram_offset+0x35/0x40 [drm_vram_helpe=
r]
>> [   20.907342] Code: 00 48 89 e5 85 c0 74 17 48 83 bf 78 01 00 00 00 7=
4 18 48 8b 87 80 01 00 00 5d 48 c1 e0 0c c3 0f 0b 48 c7 c0 ed ff ff ff 5d=
 c3 <0f> 0b 31 c0 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 18 06
>> [   20.926100] RSP: 0018:ffff9f59811d3a68 EFLAGS: 00010246
>> [   20.931339] RAX: 0000000000000002 RBX: ffff8b46861e20c0 RCX: ffffff=
ffc032d600
>> [   20.938479] RDX: ffff8b468f47a000 RSI: ffff8b46861e2000 RDI: ffff8b=
468f9acc00
>> [   20.945622] RBP: ffff9f59811d3a68 R08: 0000000000000040 R09: ffff8b=
46864ce288
>> [   20.952769] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8b=
468f47a000
>> [   20.959915] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8b=
468ad2bf00
>> [   20.967057] FS:  00007f5b37ac5cc0(0000) GS:ffff8b49efc00000(0000) k=
nlGS:0000000000000000
>> [   20.975149] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   20.980904] CR2: 00007f5b3d093f00 CR3: 0000000103438000 CR4: 000000=
00001006f0
>> [   20.988047] Call Trace:
>> [   20.990506]  ast_cursor_page_flip+0x22/0x100 [ast]
>> [   20.995313]  ast_cursor_plane_helper_atomic_update+0x46/0x70 [ast]
>> [   21.001524]  drm_atomic_helper_commit_planes+0xbd/0x220 [drm_kms_he=
lper]
>> [   21.008243]  drm_atomic_helper_commit_tail_rpm+0x3a/0x70 [drm_kms_h=
elper]
>> [   21.015062]  commit_tail+0x99/0x130 [drm_kms_helper]
>> [   21.020050]  drm_atomic_helper_commit+0x123/0x150 [drm_kms_helper]
>> [   21.026269]  drm_atomic_commit+0x4a/0x50 [drm]
>> [   21.030737]  drm_atomic_helper_update_plane+0xe7/0x140 [drm_kms_hel=
per]
>> [   21.037384]  __setplane_atomic+0xcc/0x110 [drm]
>> [   21.041953]  drm_mode_cursor_universal+0x13e/0x260 [drm]
>> [   21.047299]  drm_mode_cursor_common+0xef/0x220 [drm]
>> [   21.052287]  ? alloc_set_pte+0x10d/0x6d0
>> [   21.056244]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
>> [   21.061242]  drm_mode_cursor2_ioctl+0xe/0x10 [drm]
>> [   21.066067]  drm_ioctl_kernel+0xae/0xf0 [drm]
>> [   21.070455]  drm_ioctl+0x241/0x3f0 [drm]
>> [   21.074415]  ? drm_mode_cursor_ioctl+0x60/0x60 [drm]
>> [   21.079401]  __x64_sys_ioctl+0x91/0xc0
>> [   21.083167]  do_syscall_64+0x38/0x90
>> [   21.086755]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [   21.091813] RIP: 0033:0x7f5b3cf1350b
>> [   21.095403] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 0=
0 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f=
 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
>> [   21.114154] RSP: 002b:00007ffef1966588 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000010
>> [   21.121730] RAX: ffffffffffffffda RBX: 00007ffef19665c0 RCX: 00007f=
5b3cf1350b
>> [   21.128870] RDX: 00007ffef19665c0 RSI: 00000000c02464bb RDI: 000000=
0000000009
>> [   21.136013] RBP: 00000000c02464bb R08: 0000000000000040 R09: 000000=
0000000004
>> [   21.143157] R10: 0000000000000002 R11: 0000000000000246 R12: 000056=
1ec9d10060
>> [   21.150295] R13: 0000000000000009 R14: 0000561eca2cc9a0 R15: 000000=
0000000040

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------B3174847DA33255D6E13AF17
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------B3174847DA33255D6E13AF17--

--EPGgNqXdka1hEfB5qZbUEH7bZuwTCTGTJ--

--Jf4dsdD9FpIUnAu4WSYX3IOo5BfSgA5BY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+1d8QFAwAAAAAACgkQlh/E3EQov+BA
EQ/+PHMqV2USw5iZiVxlcrVJJvC/JzAao14QXTUU3SeQRSFuZDBKQvD346pkpZ6GJGnmsVpPTI6M
K8+546RSUchkZyK6deiXd2FVnbv0qrmdFFmGPl45Y63j98ZXC7NOcsGrfylhCe2mZ0s7lR4EBciw
0gOefD45WnK7p3CjSOXY3GHCm4zCjl9yGgJ/1LZfU6EPbDCBvfR8jT1hRDJKhDIFKn4T95oygoPj
BQwkgT+BuzUHR6rprYX+Uxuhr5X6vMQki6gR49eOys91Gp35N/17v8ppcYn4ZeUSn718NAZtCmR9
T6c01ml4OeMHw4/rECLQyyDSTHHujSvATO4yS/YAvyGJohnRhK6owEQsTaed6RbwCi+HoBoC+/4u
+CP3lx71S7i3VDt+jJ2/LJ7oJOp+ouAxKYmUklIf67wAvw1NKFEi0HE3ThdIIeDARPRq4Yv6SkeE
La5qR30xpHIwPReTatGLFd7Xi+XEpBOiTFKRU3LUIRWyyJG8FkIVf9l9LLgnHr4TksnTOW7ucnbE
Kd34Oo/Rt3uHgIhjHAo7jRho83+s/bHe0+Orz5S86X9SictU+qDMtl9cqRKkii1Eylz1d+s8d0OX
48rLyDbSfQU3lKxfkJwIDuZN29Ri527iEWfvpiICwWkP7OfDoIcoT3Law3w5yWwjNY/tmvDUhU5f
1LY=
=Vuw9
-----END PGP SIGNATURE-----

--Jf4dsdD9FpIUnAu4WSYX3IOo5BfSgA5BY--

--===============2021189817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2021189817==--
