Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECD2C1F10
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 08:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA789FC5;
	Tue, 24 Nov 2020 07:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52A89FC5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 07:44:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76C00ACF5;
 Tue, 24 Nov 2020 07:44:38 +0000 (UTC)
Subject: Re: [drm/fb] 6a1b34c0a3:
 WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work
To: Xing Zhengjun <zhengjun.xing@linux.intel.com>,
 kernel test robot <oliver.sang@intel.com>
References: <20201122141849.GH2390@xsang-OptiPlex-9020>
 <5dddb55b-cbe1-7778-3109-b84624bac407@suse.de>
 <aa34dc60-96c1-e188-a0f8-51b7f8275e69@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4acf0ddd-c2b0-2f40-40df-a4becffea64a@suse.de>
Date: Tue, 24 Nov 2020 08:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <aa34dc60-96c1-e188-a0f8-51b7f8275e69@linux.intel.com>
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
Cc: 0day robot <lkp@intel.com>, airlied@linux.ie,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============2113693224=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2113693224==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PLNeCQ1xikpLovPXsqxk2QKLV0frmPHON"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PLNeCQ1xikpLovPXsqxk2QKLV0frmPHON
Content-Type: multipart/mixed; boundary="YrzHJJ8lbY2vdni4GD9QSVojFWT7lAz8J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xing Zhengjun <zhengjun.xing@linux.intel.com>,
 kernel test robot <oliver.sang@intel.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org,
 0day robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org
Message-ID: <4acf0ddd-c2b0-2f40-40df-a4becffea64a@suse.de>
Subject: Re: [drm/fb] 6a1b34c0a3:
 WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work
References: <20201122141849.GH2390@xsang-OptiPlex-9020>
 <5dddb55b-cbe1-7778-3109-b84624bac407@suse.de>
 <aa34dc60-96c1-e188-a0f8-51b7f8275e69@linux.intel.com>
In-Reply-To: <aa34dc60-96c1-e188-a0f8-51b7f8275e69@linux.intel.com>

--YrzHJJ8lbY2vdni4GD9QSVojFWT7lAz8J
Content-Type: multipart/mixed;
 boundary="------------659560322450D81B3C21499C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------659560322450D81B3C21499C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.11.20 um 02:58 schrieb Xing Zhengjun:
>=20
>=20
> On 11/23/2020 4:04 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.11.20 um 15:18 schrieb kernel test robot:
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-9):
>>>
>>> commit: 6a1b34c0a339fdc75d7932ad5702f2177c9d7a1c ("drm/fb-helper:=20
>>> Move damage blit code and its setup into separate routine")
>>> url:=20
>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-fb-hel=
per-Various-fixes-and-cleanups/20201120-182750=20
>>>
>>>
>>>
>>> in testcase: trinity
>>> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
>>> with following parameters:
>>>
>>> =A0=A0=A0=A0runtime: 300s
>>>
>>> test-description: Trinity is a linux system call fuzz tester.
>>> test-url: http://codemonkey.org.uk/projects/trinity/
>>>
>>>
>>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2=
=20
>>> -m 8G
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire =

>>> log/backtrace):
>>
>> That dmesg is full of messages like
>>
>> [=A0 696.323556] alloc_vmap_area: 24 callbacks suppressed
>> [=A0 696.323562] vmap allocation for size 3149824 failed: use=20
>> vmalloc=3D<size> to increase size
>>
>> I think the test system needs to be reconfigured first.
>>
>=20
> We have tried "vmalloc=3D256M" and "vmalloc=3D512M", the same warning s=
till=20
> happened.

OK, then I don't know. Thanks for testing.

Best regards
Thomas

>=20
>=20
>> Best regards
>> Thomas
>>
>>>
>>>
>>> +--------------------------------------------------------------------=
---+------------+------------+=20
>>>
>>> |                                                                    =
  =20
>>> | 154f2d1afd | 6a1b34c0a3 |
>>> +--------------------------------------------------------------------=
---+------------+------------+=20
>>>
>>> |=20
>>> WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work=
=20
>>> | 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 36=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> | EIP:drm_fb_helper_damage_work | 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 36=A0=
=A0=A0=A0=A0=A0=A0=A0 |
>>> +--------------------------------------------------------------------=
---+------------+------------+=20
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> [=A0 106.616652] WARNING: CPU: 1 PID: 173 at=20
>>> drivers/gpu/drm/drm_fb_helper.c:434=20
>>> drm_fb_helper_damage_work+0x371/0x390
>>> [=A0 106.627732] Modules linked in:
>>> [=A0 106.632419] CPU: 1 PID: 173 Comm: kworker/1:2 Not tainted=20
>>> 5.10.0-rc4-next-20201120-00007-g6a1b34c0a339 #3
>>> [=A0 106.637806] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
),=20
>>> BIOS 1.12.0-1 04/01/2014
>>> [=A0 106.642853] Workqueue: events drm_fb_helper_damage_work
>>> [=A0 106.647664] EIP: drm_fb_helper_damage_work+0x371/0x390
>>> [=A0 106.652305] Code: b1 17 c7 01 68 bd 5b 2d c5 53 50 68 55 21 2d c=
5=20
>>> 83 15 44 b1 17 c7 00 e8 ae bc b1 01 83 05 48 b1 17 c7 01 83 15 4c b1 =

>>> 17 c7 00 <0f> 0b 83 05 50 b1 17 c7 01 83 15 54 b1 17 c7 00 83 c4 10=20
>>> e9 78 fd
>>> [=A0 106.663517] EAX: 0000002d EBX: c8730520 ECX: 00000847 EDX: 00000=
000
>>> [=A0 106.668423] ESI: ca987000 EDI: cab274d8 EBP: f62f5f20 ESP: f62f5=
ee8
>>> [=A0 106.673214] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS:=
=20
>>> 00010246
>>> [=A0 106.678295] CR0: 80050033 CR2: 00000000 CR3: 063a7000 CR4: 00040=
6d0
>>> [=A0 106.683160] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
>>> [=A0 106.687967] DR6: fffe0ff0 DR7: 00000400
>>> [=A0 106.690763] Call Trace:
>>> [=A0 106.693394]=A0 process_one_work+0x3ea/0xaa0
>>> [=A0 106.693501] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual=20
>>> Function Network Driver
>>> [=A0 106.695300]=A0 worker_thread+0x330/0x900
>>> [=A0 106.697406] ixgbevf: Copyright (c) 2009 - 2018 Intel Corporation=
=2E
>>> [=A0 106.702963]=A0 kthread+0x190/0x210
>>> [=A0 106.705709]=A0 ? rescuer_thread+0x650/0x650
>>> [=A0 106.708379]=A0 ? kthread_insert_work_sanity_check+0x120/0x120
>>> [=A0 106.711271]=A0 ret_from_fork+0x1c/0x30
>>> [=A0 106.713973] ---[ end trace dd528799d3369ac1 ]---
>>>
>>>
>>> To reproduce:
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 # build kernel
>>> =A0=A0=A0=A0cd linux
>>> =A0=A0=A0=A0cp config-5.10.0-rc4-next-20201120-00007-g6a1b34c0a339 .c=
onfig
>>> =A0=A0=A0=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig p=
repare=20
>>> modules_prepare bzImage
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 git clone https://github.com/intel/lkp-tests=
=2Egit
>>> =A0=A0=A0=A0=A0=A0=A0=A0 cd lkp-tests
>>> =A0=A0=A0=A0=A0=A0=A0=A0 bin/lkp qemu -k <bzImage> job-script # job-s=
cript is=20
>>> attached in this email
>>>
>>>
>>>
>>> Thanks,
>>> Oliver Sang
>>>
>>
>>
>> _______________________________________________
>> LKP mailing list -- lkp@lists.01.org
>> To unsubscribe send an email to lkp-leave@lists.01.org
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

--------------659560322450D81B3C21499C
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

--------------659560322450D81B3C21499C--

--YrzHJJ8lbY2vdni4GD9QSVojFWT7lAz8J--

--PLNeCQ1xikpLovPXsqxk2QKLV0frmPHON
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+8ueUFAwAAAAAACgkQlh/E3EQov+BO
+g/+LLZG0TP6fG5pp0hdKBQKS+o9T4I3lNM3DmcTf9123IOB2JMeEdkMoBf2Fj6JcM8aNUG4jTQo
1bmkK27WTp9TpueVH/YLz1FKbFAopyOTaWs3qohtnyNQONrPD9OJ4s1YV9sNXTrAqy6POZee82o7
WwjXYnAII5OY0m7efR8Q/uOg1For/Xf3d4z4W+bXSdCX0+//HuPJvrxslbOUWo/PCb84dtIaNEu/
BVkeRHszKWDGRweGeAqFQ0VuqFRA3rfiwH/fwWqlxvrptSlSarKLQ4V7xlS/ayYsIIob4vYMjSDd
lxbikwF3h66j9ZamOvUhOM+8A7Kc0cWyIS/TR40H6AjcKl/mRFgT8vKdTFlNTcCAGCKVmG/Yxm+G
8tEdPUVD4M8gxegZhVtdU7NK65tRfbcBf5crxphRwyKANTZnrHZpXfpbfEmNXT0ZcAILoxvVl87D
FGm8Zbp4GuGIHeRo3a3LTuBfMFce2Go1JeaVxDN4AoP5Rk3Ep7Aqvh8Fqyiuzy2dbNclBwnJHUTV
vuoB0zeCRc610WKEexTNl0lPA/RxfJRp9IKSgYMLG4VFLIsjtFcdyX3NarL8iiOoD+qdrxQ0+pi7
ph1AqVLqfuLjdijY3O4qRiiIcbNfMLQ+aABRuurOi4UdBmErsGaIhW4a4zuZ6w791tfw3ejEpPZt
Fyw=
=l0y1
-----END PGP SIGNATURE-----

--PLNeCQ1xikpLovPXsqxk2QKLV0frmPHON--

--===============2113693224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2113693224==--
