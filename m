Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B38213984
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 13:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3886EB5B;
	Fri,  3 Jul 2020 11:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5E6EB5B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 11:42:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 502E0AE7D;
 Fri,  3 Jul 2020 11:42:18 +0000 (UTC)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
 <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
 <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c3ba41c-0205-174b-3642-d676e022328c@suse.de>
Date: Fri, 3 Jul 2020 13:42:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1469942559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1469942559==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FZFL34JuvJh1HmBrAYqAsRk0W7cwWoohB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FZFL34JuvJh1HmBrAYqAsRk0W7cwWoohB
Content-Type: multipart/mixed; boundary="iToglTMgsoLgOVkBF5VlqEo34shRL5iCs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <3c3ba41c-0205-174b-3642-d676e022328c@suse.de>
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
 <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
 <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
In-Reply-To: <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>

--iToglTMgsoLgOVkBF5VlqEo34shRL5iCs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.07.20 um 12:55 schrieb Hans de Goede:
> Hi,
>=20
> On 7/1/20 4:10 PM, Thomas Zimmermann wrote:
>> Hi Daniel,
>>
>> thanks for reviewing most of the patchset.
>>
>> Am 30.06.20 um 11:06 schrieb Daniel Vetter:
>>> On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com>
>>> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
>>>>> This patchset adds support for simple-framebuffer platform devices =
and
>>>>> a handover mechanism for native drivers to take-over control of the=

>>>>> hardware.
>>>>>
>>>>> The new driver, called simplekms, binds to a simple-frambuffer
>>>>> platform
>>>>> device. The kernel's boot code creates such devices for
>>>>> firmware-provided
>>>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or
>>>>> boot
>>>>> loader sets up the framebuffers. Description via device tree is
>>>>> also an
>>>>> option.
>>>>>
>>>>> Simplekms is small enough to be linked into the kernel. The
>>>>> driver's main
>>>>> purpose is to provide graphical output during the early phases of
>>>>> the boot
>>>>> process, before the native DRM drivers are available. Native
>>>>> drivers are
>>>>> typically loaded from an initrd ram disk. Occationally simplekms
>>>>> can also
>>>>> serve as interim solution on graphics hardware without native DRM
>>>>> driver.
>>>>
>>>> Cool, thank you for doing this, this is a very welcome change,
>>>> but ... (see below).
>>>>
>>>>> So far distributions rely on fbdev drivers, such as efifb, vesafb o=
r
>>>>> simplefb, for early-boot graphical output. However fbdev is
>>>>> deprecated and
>>>>> the drivers do not provide DRM interfaces for modern userspace.
>>>>>
>>>>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
>>>>>
>>>>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM
>>>>> helpers
>>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers.
>>>>> During
>>>>> pageflips, SHMEM buffers are copied into the framebuffer memory,
>>>>> similar
>>>>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks an=
d
>>>>> regulators. It's based on the simplefb drivers, but has been
>>>>> modified for
>>>>> DRM.
>>>>>
>>>>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
>>>>> framebuffer's I/O-memory range and provides a callback function to =
be
>>>>> removed by a native driver. The native driver will remove simplekms=

>>>>> before
>>>>> taking over the hardware. The removal is integrated into existing
>>>>> helpers,
>>>>> so drivers use it automatically.
>>>>>
>>>>> I tested simplekms with x86 EFI and VESA framebuffers, which both w=
ork
>>>>> reliably. The fbdev console and Weston work automatically. Xorg
>>>>> requires
>>>>> manual configuration of the device. Xorgs current modesetting
>>>>> driver does
>>>>> not work with both, platform and PCI device, for the same physical
>>>>> hardware. Once configured, X11 works.
>>>>
>>>> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just=
 go
>>>> around and break userspace. OTOH this does seem like an userspace is=
sue
>>>> and not something which we can (or should try to) fix in the kernel.=

>>>>
>>>> I guess the solution will have to be to have this default to N for n=
ow
>>>> in Kconfig and clearly mention in the Kconfig help text that this ne=
eds
>>>> a fixed Xorg modesetting driver before it can be enabled.
>>>>
>>>> Any chance you have time to work on fixing the Xorg modesetting driv=
er
>>>> so that this will just work with the standard Xorg autoconfiguration=

>>>> stuff?
>>>
>>> Hm, why do we even have both platform and pci drivers visible at the
>>> same time? I thought the point of this is that simplekms is built-in,=

>>> then initrd loads the real drm driver, and by the time Xorg is
>>> running, simplekms should be long gone.
>>>
>>> Maybe a few more details of what's going wrong and why to help
>>> unconfuse me?
>>
>> I tested simplekms with PCI graphics cards.
>>
>> Xorg does it's own scanning of the busses. It supports a platform bus,=

>> where it finds the simple-framebuffer device that is driven by
>> simplekms. Xorg also scans the PCI bus, where is finds the native PCI
>> device; usually driven by the native driver. It's the same hardware, b=
ut
>> on different busses.
>>
>> For each device, Xorg tries to configure a screen, the Xorg modeset
>> driver tried to open the DRM device file and acquire DRM master status=

>> on it. This works for the first screen, but DRM master status can only=

>> be acquired once, so it fails for the second screen. Xorg then aborts
>> and asks for manual configuration of the display device.
>>
>> This can be solved by setting the platform device's bus id in the
>> xorg.conf device section. It just doesn't happen automatically.
>>
>> I found it hard to find a solution to this. Weston just opens a DRM
>> device file and uses whatever it gets. Ideally, Xorg would do the same=
=2E
>> That whole bus-scanning exercise gives it a wrong idea on which graphi=
cs
>> devices are available.
>>
>> One idea for a fix is to compare the device I/O-memory ranges and filt=
er
>> out duplicates on the Xorg modeset driver. I don't know how reliable
>> this works in practice or if their are false positives.
>=20
> I think that this should work nicely, although I wonder how Xorg will
> get the memory-range for the simplefb platform device, it looks like
> it will need to parse /dev/iomem for this, or we need to add a
> new sysfs attr to the simplefb device for this. Adding the new sysfs
> attr has the added bonus that we only enable the duplicate based
> resource check for simplefb devices.
>=20
> Hmm, I think we can actually fix this quite simply, for the platform
> device, check the basename of where the
> /sys/bus/platform/devices/XXXX/driver symlink points to and if it
> is simplekms ignore it, assuming that there will be another PCI
> or platform device which is the actual GPU.

That probably would not work. On aarch64, we (SUSE) utilize EFI via
grub-privided efi stubs (as far as i understand). This allows us to use
the kernel's efifb driver for boot-up graphics. But there's no PCI bus
on most of these systems. I don't think Xorg could rely on that.

>=20
> I guess that might cause a problem where the output-device driven
> through simplekms is not visible to Xorg in any other way, but
> I don't think that that ever happens?=C2=A0 And even if it does, then i=
t
> is probably better to teach Xorg about it, since we likely want to
> replace simplekms with a more full-featured driver at some point
> anyways.
>=20
> Can you try commenting out the platform bus scanning code in Xorg's
> autoconfigure code and see if that fixes the no Xorg.conf case ?

That works to some extent. Xorg drivers provide a bus-specific probe
function. Returning false from the platform-probe function in the Xorg
modesetting driver makes the PCI side work on top of simplekms.

Returning false from the Xorg driver's PCI-probe function does not work
however. It's some Xorg weirdness, I guess.

What I'd want is to accept the platform device, but later fails for the
PCI device.

>=20
> If it does the driver symlink trick will probably fix 99.9 %
> of all cases here, and we can worry about the others if we
> ever encounter them.
>=20
>> A more fundamental solution is to introduce a DRM bus in Xorg that
>> enumerates all available DRM device files. If there are any, no other
>> busses would be scanned.
>=20
> That would break the case where there are 2 cards and 1 has a kms
> driver and the other only supports fbdev. Admittedly this is a
> corner case, but I do believe that we cannot just go and break this.

Yep, that was my concern.

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iToglTMgsoLgOVkBF5VlqEo34shRL5iCs--

--FZFL34JuvJh1HmBrAYqAsRk0W7cwWoohB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7/GZUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPJTAf/Tzt9HNTkv5u4bjGbaX8aooF2xL+U
CSMbp42KGjOSgZ0lSMjPatjnEXW3y0PVRbfwQS0ToRe+i87aC0gB5SveXeLSWFCB
SchQmLJV+bDsHGaVQatmeKlzI+fo+0GaYaYkW10wux0Bu12nHKq4YYj0TPlhnhgZ
sPKZp8NCCfjMzzls9wD+hujg6qMnmZ7zaCVKW1aE8UMgSmCohrGt+4zkJ5NSGWqZ
UTkNbASLSuy/QegpVcBsnrxDX8FxPM5jGG86lrQyLxrcLz5khJf06HE2fpX9irXh
DYQ6k4uSwF4AmMU2DMuBNkDuiulyTZ5JQvK2N5twtAOJvhlUFF9gPftg2g==
=Cb8V
-----END PGP SIGNATURE-----

--FZFL34JuvJh1HmBrAYqAsRk0W7cwWoohB--

--===============1469942559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1469942559==--
