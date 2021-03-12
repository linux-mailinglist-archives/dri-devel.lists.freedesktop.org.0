Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF66338700
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE996F47C;
	Fri, 12 Mar 2021 08:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2566F47A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 08:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8D10AEBD;
 Fri, 12 Mar 2021 08:03:47 +0000 (UTC)
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
 <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
 <1761762.3HQLrFs1K7@nerdopolis>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
Message-ID: <cf7a886b-93de-b8d5-4028-e3aa0cf24b0d@suse.de>
Date: Fri, 12 Mar 2021 09:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1761762.3HQLrFs1K7@nerdopolis>
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
Content-Type: multipart/mixed; boundary="===============0853421569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0853421569==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eiHxln71B18eTDlcQuQJWpSawCjX5DUFV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eiHxln71B18eTDlcQuQJWpSawCjX5DUFV
Content-Type: multipart/mixed; boundary="lO13tQPDiIxZFpRjorbMJIBjHrAOuYU1j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org
Message-ID: <cf7a886b-93de-b8d5-4028-e3aa0cf24b0d@suse.de>
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
 <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
 <1761762.3HQLrFs1K7@nerdopolis>
In-Reply-To: <1761762.3HQLrFs1K7@nerdopolis>

--lO13tQPDiIxZFpRjorbMJIBjHrAOuYU1j
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.03.21 um 04:49 schrieb nerdopolis:
> On Wednesday, March 10, 2021 4:10:35 AM EST Thomas Zimmermann wrote:
>> Hi
>>
>> Am 10.03.21 um 03:50 schrieb nerdopolis:
>>> On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
>>>> Hey
>>>>
>>>> On request of Noralf, I picked up the patches and prepared v5. Works=
 fine with
>>>> Xorg, if configured according to:
>>>>       https://lists.freedesktop.org/archives/dri-devel/2014-January/=
052777.html
>>>> If anyone knows how to make Xorg pick it up dynamically without such=
 a static
>>>> configuration, please let me know.
>>>>
>>>>
>>>>
>>> Hi
>>>
>>> I am kind of curious as I do have interest in seeing this merged as w=
ell.
>>
>> Please take a look at [1]. It's not the same driver, but something to
>> the same effect. I know it's been almost a year, but I do work on this=

>> and intend to come back with a new version during 2021.
>>
>> I currently work on fastboot support for the new driver. But it's a
>> complicated matter and takes time. If there's interest, we could talk
>> about merging what's already there.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lore.kernel.org/dri-devel/20200625120011.16168-1-tzimmermann@s=
use.de/
>>
>>>
>>> There is an email in this thread from 2018, but when I tried to impor=
t an mbox
>>> file from the whole month for August 2018, for some reason, kmail doe=
sn't see
>>> the sender and mailing list recipient in that one, so I will reply to=
 this one,
>>> because I was able to import this into my mail client.
>>> https://www.spinics.net/lists/dri-devel/msg185519.html
>>>
>>> I was able to get this to build against Linux 4.8, but not against a =
newer
>>> version, some headers seem to have been split, and some things are of=
f by 8
>>> and other things. I could NOT find a git repo, but I was able to find=
 the
>>> newest patches I could find, and import those with git am against 4.8=
 with
>>> some tweaks. If that is needed, I can link it, but only if you want.
>>>
>>> However in QEMU I wasn't able to figure out how to make it create a
>>> /dev/dri/card0 device, even after blacklisting the other modules for =
qxl,
>>> cirrus, etc, and then modprobe-ing simpledrm
>>>
>>> In my view something like this is would be useful. There still could =
be
>>> hardware devices that don't have modesetting support (like vmvga in
>>> qemu/virt-manager as an example). And most wayland servers need a
>>> /dev/dri/card0 device as well as a potential user-mode TTY replacemen=
t would
>>> also need /dev/dri/card0
>>>
>>> I will admit I unfortunately failed to get it to build against master=
=2E I
>>> couldn't figure out some of the changes, where some new structs were =
off by
>>> a factor of 8.
>>>
>>>
>>> Thanks
>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>>
> Hi
>=20
> I tried simplekms against v5.9, and it built, and it runs, and is prett=
y neat.
>=20
> I tried using the qxl, cirrus, and vmware card in QEMU. Weston starts o=
n all
> of them. And I did ensure that the simplekms driver was being used

Cool! Thanks a lot. When I submit the next patchset can I add

Tested-by: nerdopolis <bluescreen_avenger@verizon.net>

to the tags?

>=20
> That is, it works after adding GRUB_GFXPAYLOAD_LINUX=3Dkeep , to avoid =
having to
> set a VGA option. (although not sure the equivalent in syslinux yet)

Yeah, it's a known 'limitation.' (1) But it's usually something that=20
Linux distributions take care of.

The rsp kernel feature needs a set up from the firmware/bootloader/etc.=20
Once the driver has been merged, added other generic drivers (EFI, VESA, =

etc) should be a lot easier. Those would maybe not require the firmware=20
setup.

Best regards
Thomas

(1) Well, it's the way it's supposed to work.

>  =20
>=20
> Thanks.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lO13tQPDiIxZFpRjorbMJIBjHrAOuYU1j--

--eiHxln71B18eTDlcQuQJWpSawCjX5DUFV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBLIGIFAwAAAAAACgkQlh/E3EQov+AC
cg/+O9FRgE36RO+T63tazr9P21rJHZS2idiQp/ELlEdaA4AJDMUs7H6HwGPNTxhBg8zRzUaNqarl
xQsOrKwJI48niPO4yBL1m+/5txWfK1yG22Rj4p96EGPFc4OCf2Ux9uqggMLSrmwIlghvpL6ZCg9Q
XFjph5LoO1IJ5T0zfLfifE0MSR9If//nkaIn6K9ROyZOboxaKE0XnKmR03UjhHYqpntdktAsOerx
99nn15WDCf3B8/b7Tz2GwMrgjWZXrwFnurtyCiJnBZQHNLTiWW1xO0t4I3ggCgDDQFZLyVGnS4PR
RdwHqtHkbQHFNaGzgyA4oVqQMDunwBvyzbqT01Hp0xTAE/va8Tk7/xnkXuofUY2YaeM6X+z9uI1H
+TZGJ1vzaxY08t2nE2gAE0bg8pc3XV+H/QcjIsa8Z+GIgKsaK+Z1KgJuFAW36lLxBaS9W3duaZ0b
7AH5+Q32Qarf0JE7qArpIY0e09ty14rEPKoIKnvq0echvF1eXiD9psFbGbIBgyQCRlLG2vqF88My
iuoYQMpHyi6i2+tcRtk+M8xD+AATVnGkDFxMUt4ripapjKbWSmQOB5j/jHVU8s5wixEr94Zz4Se6
/W5Ds7wbT18KLN1U67663n+s3tE0aLBQF16zLYKAZyjrXT+liFEvQ7BQJSou+Q40UpWxx31bYpx9
heE=
=DLPI
-----END PGP SIGNATURE-----

--eiHxln71B18eTDlcQuQJWpSawCjX5DUFV--

--===============0853421569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0853421569==--
