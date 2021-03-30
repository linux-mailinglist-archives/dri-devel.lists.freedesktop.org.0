Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38E34E1C7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 09:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA766E85B;
	Tue, 30 Mar 2021 07:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACF26E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:09:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0382EB159;
 Tue, 30 Mar 2021 07:09:45 +0000 (UTC)
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
 robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
 bluescreen_avenger@verizon.net
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
 <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b2d6798f-1f7e-6fd4-eefd-b7bb4f080973@suse.de>
Date: Tue, 30 Mar 2021 09:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============0267513498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0267513498==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GrNnU5D5uTGekbkZivtLPtTs6QuxygdRY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GrNnU5D5uTGekbkZivtLPtTs6QuxygdRY
Content-Type: multipart/mixed; boundary="GOseElHxPn8pzbotuD4CGWcFtc0n7BtoE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
 robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
 bluescreen_avenger@verizon.net
Cc: virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Message-ID: <b2d6798f-1f7e-6fd4-eefd-b7bb4f080973@suse.de>
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
 <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
In-Reply-To: <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>

--GOseElHxPn8pzbotuD4CGWcFtc0n7BtoE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 29.03.21 um 16:50 schrieb Hans de Goede:
> Hi,
>=20
> On 3/29/21 2:31 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 25.03.21 um 12:29 schrieb Hans de Goede:
>>> Hi,
>>>
>>> On 3/18/21 11:29 AM, Thomas Zimmermann wrote:
>>>> This patchset adds support for simple-framebuffer platform devices a=
nd
>>>> a handover mechanism for native drivers to take-over control of the
>>>> hardware.
>>>>
>>>> The new driver, called simpledrm, binds to a simple-frambuffer platf=
orm
>>>> device. The kernel's boot code creates such devices for firmware-pro=
vided
>>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or b=
oot
>>>> loader sets up the framebuffers. Description via device tree is also=
 an
>>>> option.
>>>>
>>>> Simpledrm is small enough to be linked into the kernel. The driver's=
 main
>>>> purpose is to provide graphical output during the early phases of th=
e boot
>>>> process, before the native DRM drivers are available. Native drivers=
 are
>>>> typically loaded from an initrd ram disk. Occationally simpledrm can=
 also
>>>> serve as interim solution on graphics hardware without native DRM dr=
iver.
>>>>
>>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or=

>>>> simplefb, for early-boot graphical output. However fbdev is deprecat=
ed and
>>>> the drivers do not provide DRM interfaces for modern userspace.
>>>>
>>>> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
>>>>
>>>> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
>>>> framebuffer's I/O-memory range and provides a callback function to b=
e
>>>> removed by a native driver. The native driver will remove simpledrm =
before
>>>> taking over the hardware. The removal is integrated into existing he=
lpers,
>>>> so drivers use it automatically.
>>>>
>>>> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM h=
elpers
>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. D=
uring
>>>> pageflips, SHMEM buffers are copied into the framebuffer memory, sim=
ilar
>>>> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and=

>>>> regulators. It's based on the simplefb drivers, but has been modifie=
d for
>>>> DRM.
>>>
>>> Thank you for your work on this, this is very interesting.
>>>
>>>> I've also been working on fastboot support (i.e., flicker-free booti=
ng).
>>>> This requires state-readout from simpledrm via generic interfaces, a=
s
>>>> outlined in [1]. I do have some prototype code, but it will take a w=
hile
>>>> to get this ready. Simpledrm will then support it.
>>>>
>>>> I've tested simpledrm with x86 EFI and VESA framebuffers, which both=
 work
>>>> reliably. The fbdev console and Weston work automatically. Xorg requ=
ires
>>>> manual configuration of the device. Xorgs current modesetting driver=
 does
>>>> not work with both, platform and PCI device, for the same physical
>>>> hardware. Once configured, X11 works. I looked into X11, but couldn'=
t see
>>>> an easy way of fixing the problem. With the push towards Wayland+Xwa=
yland
>>>> I expect the problem to become a non-issue soon. Additional testing =
has
>>>> been reported at [2].
>>>>
>>>> One cosmetical issue is that simpledrm's device file is card0 and th=
e
>>>> native driver's device file is card1. After simpledrm has been kicke=
d out,
>>>> only card1 is left. This does not seem to be a practical problem how=
ever.
>>>>
>>>> TODO/IDEAS:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* provide deferred takeover
>>>
>>> I'm not sure what you mean with this ?=C2=A0 Currently deferred-takeo=
ver is
>>> handled in the fbcon code. Current flickerfree boot works like this
>>> (assuming a single LCD panel in a laptop):
>>>
>>> 1. EFI/GOP sets up the framebuffer, draws a vendor logo
>>> 2. The bootloader runs in silent mode and does not touch anything gfx=
 related
>>> 3. kernel boots, with a loglevel of 3 so only CRIT/EMERG messages are=
 shown
>>> 2. efifb loads; and tells fbcon that a framebuffer is now available f=
or it to "bind"
>>>  =C2=A0=C2=A0=C2=A0 to. Since CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAK=
EOVER=3Dy fbcon defers taking over
>>>  =C2=A0=C2=A0=C2=A0 the console and leaves the dummy-console driver i=
n place (unless there have already
>>>  =C2=A0=C2=A0=C2=A0 been kernel messages logged, which there shouldn'=
t because loglevel=3D3)
>>> 3. i915 loads, reads out the hw state compares this to the preferred-=
mode for the
>>>  =C2=A0=C2=A0=C2=A0 panel which it would set, they match, nothing hap=
pens. i915 takes ownership
>>>  =C2=A0=C2=A0=C2=A0 of the scanout-buffer set up by the GOP, but leav=
es it in place.
>>>  =C2=A0=C2=A0=C2=A0 i915 also removes the efifb /dev/fb0 and installs=
 its own /dev/fb0 fbdev compat
>>>  =C2=A0=C2=A0=C2=A0 device, fbcon is notified of this, but is still d=
eferred and leaves the dummy
>>>  =C2=A0=C2=A0=C2=A0 console driver in place as console driver.
>>> 4. Plymouth loads, allocates a new scan-out buffer at the panel's pre=
ferred resolution,
>>>  =C2=A0=C2=A0=C2=A0 plymouth reads the vendor-logo through the BGRT A=
CPI interface and fills the
>>>  =C2=A0=C2=A0=C2=A0 scanout-buffer with the vendor-logo + a spinner. =
Then plymouth installs the new
>>>  =C2=A0=C2=A0=C2=A0 scanout-buffer on the crtc, this is done atomical=
ly during vsync, so the user
>>>  =C2=A0=C2=A0=C2=A0 sees no changes, other then the spinner appearing=

>>>  =C2=A0=C2=A0=C2=A0 (note the active VT is now in graphical mode)
>>> 5. From here on not flickering is a userspace problem
>>>
>>> AFAICT this should work fine with simplekms too, unless it clears the=
 screen
>>> to black when it binds.
>>
>> I forgot to add the code that clears the screen, but that's the case h=
ere.
>>
>> Instead of a plane-disable operation, simpledrm can at best clear the =
screen. This would happen during the initial mode-config reset IIRC.
>=20
> Hmm, clearing the screen without any (atomic) modesets being initiated =
by either
> an in kernel drm-client or userspace seems wrong, this is certainly dif=
ferent from
> what the i915 driver does. The way I see it either a drm client provide=
s a new
> framebuffer in which case you copy that over the old contents, effectiv=
ely clearing
> it. Or a drm-client gets a handle and draws to the current fb directly,=
 in which
> case it is the clients responsibility to clear it itself first.
>=20
> IOW I believe that simpledrm should not clear the screen itself at all.=


I do as well. And when I boot with simpledrm + native driver it's=20
flicker-free from what I can tell. But drm_mode_config_reset() is=20
supposed to reset HW and software state. There could be some corner case =

where we'd have to clear the screen. For now, it should be fine.

BTW if you have the time I'd appreciate your review of the patchset.

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>> But we need to keep the display content stored in a framebuffer, so re=
ad-out helpers are required. There are more users of these read-out helpe=
rs. Adding them at some point probably makes sense.
>>
>> Other drivers might also want to read the initial config from simpledr=
m via read-out helpers. I think only i915 currently supports something li=
ke that ATM.
>>
>> Best regards
>> Thomas
>>
>>>
>>> An addition to the above sequence, if at any time either the kernel o=
r userspace
>>> prints a message to the console; and at that time a fbdev is register=
ed then fbcon
>>> will takeover as the console driver from the dummy driver and it will=
 start drawing
>>> to the registered fbdev (1), destroying the framebuffer contents. Als=
o if any messages
>>> where printend while no fbdev was registered, then fbcon will takeove=
r the console
>>> as soon as a fbdev gets registered.
>>>
>>> So since we already have deferred-takeover in the fbcon code, I wonde=
r what you
>>> mean when you are talking about "provide deferred takeover" for simpl=
ekms?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> 1) Except when the VT has been switched to GFX mode when this happens=
, then fbcon
>>> will delay using the fbdev until the VT is switched back to text mode=
=2E
>>>
>>>
>>> p.s.
>>>
>>> This has the interesting side effect then when logging into a desktop=
 GUI session:
>>> kernel -> plymouth -> gdm -> GNOME user session
>>>
>>> There never is any output to the text-console and fbcon never takes-o=
ver, so on
>>> many Laptops running say Fedora workstation the fbcon code is actuall=
y unused
>>> until the user manually switches to another virtual-console to log in=
 in
>>> text-mode:
>>>
>>> [hans@x1 ~]$ dmesg | grep -E 'fbcon|Console:|Truecolor'
>>> [=C2=A0=C2=A0=C2=A0 0.258904] Console: colour dummy device 80x25
>>> [=C2=A0=C2=A0=C2=A0 1.274726] efifb: Truecolor: size=3D8:8:8:8, shift=
=3D24:16:8:0
>>> [=C2=A0=C2=A0=C2=A0 1.274768] fbcon: Deferring console take-over
>>> [=C2=A0=C2=A0=C2=A0 2.540894] fbcon: i915drmfb (fb0) is primary devic=
e
>>> [=C2=A0=C2=A0=C2=A0 2.540896] fbcon: Deferring console take-over
>>> [hans@x1 ~]$ uptime
>>>  =C2=A0 12:29:39 up=C2=A0 4:19,=C2=A0 1 user,=C2=A0 load average: 0.5=
8, 0.75, 0.81
>>>
>>> Look mom no fbcon
>>>
>>>
>>>
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* provide bootsplash DRM client
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* make simplekms usable with ARM-EFI fbs
>>>>
>>>> v2:
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* rename to simpledrm, aperture helpers
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* reorganized patches
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* use hotplug helpers for removal (Daniel)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* added DT match tables (Rob)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* use shadow-plane helpers
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0* lots of minor cleanups
>>>>
>>>> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5=
Ra8CxPvJ=3D9BwmvfU-O0gg@mail.gmail.com/
>>>> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/=

>>>>
>>>> Thomas Zimmermann (10):
>>>>  =C2=A0=C2=A0 drm/format-helper: Pass destination pitch to drm_fb_me=
mcpy_dstclip()
>>>>  =C2=A0=C2=A0 drm/format-helper: Add blitter functions
>>>>  =C2=A0=C2=A0 drm/aperture: Move fbdev conflict helpers into drm_ape=
rture.h
>>>>  =C2=A0=C2=A0 drm/aperture: Add infrastructure for aperture ownershi=
p
>>>>  =C2=A0=C2=A0 drm: Add simpledrm driver
>>>>  =C2=A0=C2=A0 drm/simpledrm: Add fbdev emulation
>>>>  =C2=A0=C2=A0 drm/simpledrm: Initialize framebuffer data from device=
-tree node
>>>>  =C2=A0=C2=A0 drm/simpledrm: Acquire clocks from DT device node
>>>>  =C2=A0=C2=A0 drm/simpledrm: Acquire regulators from DT device node
>>>>  =C2=A0=C2=A0 drm/simpledrm: Acquire memory aperture for framebuffer=

>>>>
>>>>  =C2=A0 Documentation/gpu/drm-internals.rst=C2=A0=C2=A0=C2=A0 |=C2=A0=
 12 +
>>>>  =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>>>>  =C2=A0 drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>>>>  =C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>>  =C2=A0 drivers/gpu/drm/drm_aperture.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 287 ++++++++
>>>>  =C2=A0 drivers/gpu/drm/drm_format_helper.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 96 ++-
>>>>  =C2=A0 drivers/gpu/drm/mgag200/mgag200_mode.c |=C2=A0=C2=A0 2 +-
>>>>  =C2=A0 drivers/gpu/drm/tiny/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +
>>>>  =C2=A0 drivers/gpu/drm/tiny/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>>  =C2=A0 drivers/gpu/drm/tiny/cirrus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>  =C2=A0 drivers/gpu/drm/tiny/simpledrm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 932 +++++++++++++++++++++++++
>>>>  =C2=A0 include/drm/drm_aperture.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 96 +++
>>>>  =C2=A0 include/drm/drm_fb_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 56 +-
>>>>  =C2=A0 include/drm/drm_format_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 10 +-
>>>>  =C2=A0 14 files changed, 1466 insertions(+), 60 deletions(-)
>>>>  =C2=A0 create mode 100644 drivers/gpu/drm/drm_aperture.c
>>>>  =C2=A0 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
>>>>  =C2=A0 create mode 100644 include/drm/drm_aperture.h
>>>>
>>>> --=20
>>>> 2.30.1
>>>>
>>>
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--GOseElHxPn8pzbotuD4CGWcFtc0n7BtoE--

--GrNnU5D5uTGekbkZivtLPtTs6QuxygdRY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBizrcFAwAAAAAACgkQlh/E3EQov+A7
hBAAzLG0voxnjXgThIj058MArVDcEKhl5/KCWLWyZHSQ6PidIynvnE5OioCgTNfuT5KX+6JdIy7j
QpmD31w3bceSq0UIuVBudEXXCygjHP/ctHcto5tL4ptQec1pHe30r0FuBLOrdzfS2K7jGTVm7pVu
pSJu1YeT+L4/pNGcRRCQwkLjvziNB2QE4PNb0FWPBJFYeQFUXWyc/PeOW7/U7vvgXpkRKcpb7wre
oUO61eu5VPToaiavei3DhGzDzR/kExgM52uKJfEE7OgMBAgCyBxkrZljFT9p7M43k/fvW3mkGzk8
yWjIci5ta3c7uQ9JQ74HITG+ePREvwozAR7j2a2/Hhyu5s5r4tJdoWTKZFcG5LEUQzrSDWtRTDoq
3lUY4vicZCnJhsRoVBUQt4qxW4TN9FLd1cYjU2tCe6u9E82klw9rLKEGEEhLV9Y5RO+dj2hmfbpG
75tmaNxmVgmwxPC5KhRh15Q7/k+RI2DmtVuu5HcKkdi+S2oAbbWF0eo3cX1R13ImHTFy6BH02s51
NunbiPUoSgkdhYZuHiU/MWGU3GLc6jA+c5vt6CahMmgwCniuz6EKWlYmfv63pLdbaZ8djF1L9iOk
4g6Xefo70K6Y8EWpaD7paZWsucB0tzlsP2zn6p33ybfXy0VwXORayiE/WOh3OPL11NzwGtLnoBoy
VOw=
=JRwr
-----END PGP SIGNATURE-----

--GrNnU5D5uTGekbkZivtLPtTs6QuxygdRY--

--===============0267513498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0267513498==--
