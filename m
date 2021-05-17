Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DB3865ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDBB6EA7F;
	Mon, 17 May 2021 20:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1126EA7F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:10:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E039AEB3;
 Mon, 17 May 2021 20:10:27 +0000 (UTC)
To: Daniel Stone <daniel@fooishbar.org>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
Date: Mon, 17 May 2021 22:10:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NFHqMJwoHIrsns3XVxpIlH2sC2mAI5CYJ"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NFHqMJwoHIrsns3XVxpIlH2sC2mAI5CYJ
Content-Type: multipart/mixed; boundary="K92ICiUqb6mZ9P0TPPbr7Mp5YSGvgYWXg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
In-Reply-To: <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>

--K92ICiUqb6mZ9P0TPPbr7Mp5YSGvgYWXg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.05.21 um 21:32 schrieb Daniel Stone:
> Hi,
>=20
> On Mon, 17 May 2021 at 20:12, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
>>> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu =
or
>>> think G as in General, not Graphisc.
>>
>> I hope this was a joke.
>>
>> Just some thoughts:
>>
>> AFAICT AI first came as an application of GPUs, but has now
>> evolved/specialized into something of its own. I can imagine sharing
>> some code among the various subsystems, say GEM/TTM internals for memo=
ry
>> management. Besides that there's probably little that can be shared in=

>> the userspace interfaces. A GPU is device that puts an image onto the
>> screen and an AI accelerator isn't.
>=20
> But it isn't. A GPU is a device that has a kernel-arbitrated MMU
> hosting kernel-managed buffers, executes user-supplied compiled
> programs with reference to those buffers and other jobs, and informs
> the kernel about progress.
>=20
> KMS lies under the same third-level directory, but even when GPU and
> display are on the same die, they're totally different IP blocks
> developed on different schedules which are just periodically glued
> together.

I mentioned this elsewhere: it's not about the chip architecture, it's=20
about the UAPI. In the end, the GPU is about displaying things on a=20
screen. Even if the rendering and the scanout engines are on different=20
IP blocks. (Or different devices.)

The fact that one can do general purpose computing on a GPU is a=20
byproduct of the evolution of graphics hardware. It never was the goal.


>=20
>> Treating both as the same, even if
>> they share similar chip architectures, seems like a stretch. They migh=
t
>> evolve in different directions and fit less and less under the same
>> umbrella.
>=20
> Why not? All we have in common in GPU land right now is MMU + buffer
> references + job scheduling + synchronisation. None of this has common
> top-level API, or even a common top-level model. It's not just ISA
> differences, but we have very old-school devices where the kernel
> needs to register fill on every job, living next to middle-age devices
> where the kernel and userspace co-operate to fill a ring buffer,
> living next to modern devices where userspace does some stuff and then
> the hardware makes it happen with the bare minimum of kernel
> awareness.

I see all this as an example why AI should not live under gpu/. There=20
are already many generations of GPUs with different feature sets=20
supported. Why lump more behind the same abstractions if AI can take a=20
fresh start? Why should we care about AI and why should AI care about=20
all our legacy.

We can still share all the internal code if AI needs any of it.=20
Meanwhile AI drivers can provide their own UAPIs until a common=20
framework emerges.

Again, just my 2 cents.

Best regards
Thomas

>=20
> Honestly I think there's more difference between lima and amdgpu then
> there is between amdgpu and current NN/ML devices.
>=20
> Cheers,
> Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--K92ICiUqb6mZ9P0TPPbr7Mp5YSGvgYWXg--

--NFHqMJwoHIrsns3XVxpIlH2sC2mAI5CYJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCizbEFAwAAAAAACgkQlh/E3EQov+A8
kQ//a1dFkecSMSxjo3CuElZhkeSdPEjiiN5ZeVIzu9sRyF7VCzK6CyMWatau941D29mIGsti8H4b
tsLYTym7dJVH9r6d+lvvb+b57VGSA1DnN4422x+Zd/jl/KrFbVj5qcYoCIgIhlFav5omHGoHxigN
whLuhwc00USOYaY+TafWZwmBILgY2sz2+SyJPjSbFy1JkmNDeDEa7uGQjmBAaTq0OP7k1c60jd6C
wwZuI8uImxjtqJeOMNk9xtoLKnHUUTV0esZYAUQkQJSmWz+8f+0ShGlur3lG2lGJiL9FhXtBMZ5p
yBXaGbLD7l+e5ioRTCCYyRbQab0HCacARp/+l+TSYcEtI9Si5uI3K5AR1gq8n8Mo5UOniNdWRz5d
p4wv1qzw1f5nTnt6XH4TiWL13nm6BWr2WpnH1aEZfZkjacHkptFsY8t0cheiL/VicRIdZmwnbrnF
27qtY2h092RgWeigFsRhzD/jK2LSixh+MnB6pM7A8kGILq6alg8j0DwMo9uEo8ozc5/gwhesaYm1
9EYtTkI5gQVKs7CN5+bjF0n+p4Nzso/RUMC8bWKLXYxnRJKJd+C63ApQbdkQYxYEfWaj3rfTdL4a
ipgyR7zJXT8Jxo+sQnrXpeEuydrSP9oMl2uujbqWiSPBxDH4uEy7QU8X/Al5+PFYKvvI85HifgL2
Xv8=
=mHQv
-----END PGP SIGNATURE-----

--NFHqMJwoHIrsns3XVxpIlH2sC2mAI5CYJ--
