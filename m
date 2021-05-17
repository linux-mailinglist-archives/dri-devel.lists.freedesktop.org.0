Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0B383DC7
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E96B6EA6E;
	Mon, 17 May 2021 19:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDF56EA70
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:49:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAABFAECD;
 Mon, 17 May 2021 19:49:51 +0000 (UTC)
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
Date: Mon, 17 May 2021 21:49:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BeFuMqkIKeU5e5dXQV293ifpK4BZ1eQ0O"
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BeFuMqkIKeU5e5dXQV293ifpK4BZ1eQ0O
Content-Type: multipart/mixed; boundary="QQltFApC08E4BoFqxUYYhiN08Px1ylIbQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Message-ID: <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
In-Reply-To: <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>

--QQltFApC08E4BoFqxUYYhiN08Px1ylIbQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.05.21 um 21:23 schrieb Alex Deucher:
> On Mon, May 17, 2021 at 3:12 PM Thomas Zimmermann <tzimmermann@suse.de>=20
wrote:
>>
>> Hi
>>
>> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
>>> On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
>>>> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
>>>> <gregkh@linuxfoundation.org> wrote:
>>>>> On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:=

>>>>>> Dear kernel maintainers,
>>>>>>
>>>>>> This submission is a kernel driver to support Intel(R) Gaussian & =
Neural
>>>>>> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-=
processor
>>>>>> available on multiple Intel platforms. AI developers and users can=20
offload
>>>>>> continuous inference workloads to an Intel(R) GNA device in order =
to
>> free
>>>>>> processor resources and save power. Noise reduction and speech rec=
ognition
>>>>>> are the examples of the workloads Intel(R) GNA deals with while it=
s usage
>>>>>> is not limited to the two.
>>>>>
>>>>> How does this compare with the "nnpi" driver being proposed here:
>>>>>           https://lore.kernel.org/r/20210513085725.45528-1-guy.zadi=
cario@intel.com
>>>>>
>>>>> Please work with those developers to share code and userspace api a=
nd
>>>>> tools.  Having the community review two totally different apis and
>>>>> drivers for the same type of functionality from the same company is=

>>>>> totally wasteful of our time and energy.
>>>>
>>>> Agreed, but I think we should go further than this and work towards =
a
>>>> subsystem across companies for machine learning and neural networks
>>>> accelerators for both inferencing and training.
>>>
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
>> screen and an AI accelerator isn't. Treating both as the same, even if=

>> they share similar chip architectures, seems like a stretch. They migh=
t
>> evolve in different directions and fit less and less under the same
>> umbrella.
>=20
> The putting something on the screen is just a tiny part of what GPUs
> do these days.  Many GPUs don't even have display hardware anymore.
> Even with drawing APIs, it's just some operation that you do with
> memory.  The display may be another device entirely.  GPUs also do
> video encode and decode, jpeg acceleration, etc.  drivers/gpu seems
> like a logical place to me.  Call it drivers/accelerators if you like.
> Other than modesetting most of the shared infrastructure in
> drivers/gpu is around memory management and synchronization which are
> all the hard parts.  Better to try and share that than to reinvent
> that in some other subsystem.

I'm not sure whether we're on the same page or not.

I look at this from the UAPI perspective: the only interfaces that we=20
really standardize among GPUs is modesetting, dumb buffers, GEM. The=20
sophisticated rendering is done with per-driver interfaces. And=20
modesetting is the thing that AI does not do.

Sharing common code among subsystems is not a problem. Many of our=20
more-sophisticated helpers are located in DRM because no other=20
subsystems have the requirements yet. Maybe AI now has and we can move=20
the rsp shareable code to a common location. But AI is still no GPU. To=20
give a bad analogy: GPUs transmit audio these days. Yet we don't treat=20
them as sound cards.


Best regards
Thomas

>=20
> Alex
>=20
>>
>> And as Dave mentioned, these devices are hard to obtain. We don't real=
ly
>> know what we sign up for.
>>
>> Just my 2 cents.
>>
>> Best regards
>> Thomas
>>
>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QQltFApC08E4BoFqxUYYhiN08Px1ylIbQ--

--BeFuMqkIKeU5e5dXQV293ifpK4BZ1eQ0O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCiyN0FAwAAAAAACgkQlh/E3EQov+DF
fw//RUaoVByJlvhp8HvTBwphU8uii0Fd9OsuYDnje4M0qFBa2wC2ohUTtb/pq5rpAWovWI5Hmzli
I0OlXzG+zrZCdXm3BO53EBGyS403ATVntmTrGYyq6NiR7SfUsDxYjDoSvlC8WqYrB39k+nHYaTbj
+rlN6DwzDmc7iaNa3B8A1V7vA2Rh8wFeDq5LFCwkgKDswJw8pWoORHsQ0NoXmdzUxlgp3VpRYX6Y
Fhg2syFvXIO4x7YQ0LZbpYK97PDT16FAKgKq/XgM/7vfu2qHLCNmwIaoAS/5vlTmU1dmSaNcJh89
1WMDbvL6m1aUpymivxlspUCuL1V1oMjSQ8BJhRPTIX955myoA8k1AehzlG4uOB53eT0oxed8j/UG
DHVyhnw8wyVleedJr33u2unag2LrBqqZLaCttzvz3XBbC1zfjhkzFGNBx2E5aGkhI9KFSMngdP7t
K/UM/LAviQ+hGz77sxPxJ1wiovcCrbFKYEUGe+FzQIEB5Rxnd6lYu/Nv66EAM1Oi0Zz9fSfYaDSP
gZ6y8Z/Y0jOItlEKZYpHFjot7hGi3sgLCNr4qaXusFTx60b7Wj9FPCmxTYW4Xd/cHERCDB45ui0u
6RRMkhnrpWNC5O5DG5USYZfckNChLuUriMr7zlS3e5XJgQxIuW3BGEjLHkaafIzaDFQOH2jSM7s3
nSs=
=PY8l
-----END PGP SIGNATURE-----

--BeFuMqkIKeU5e5dXQV293ifpK4BZ1eQ0O--
