Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE5386B15
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68956EA82;
	Mon, 17 May 2021 20:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379A56EA82
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:15:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF6C8AEB3;
 Mon, 17 May 2021 20:15:49 +0000 (UTC)
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
 <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
 <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c28703a4-6936-15f2-730f-c3d96e1326a5@suse.de>
Date: Mon, 17 May 2021 22:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6jSQ74WCN6fjyYkRQIxlywyhJlLUuOPzX"
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
--6jSQ74WCN6fjyYkRQIxlywyhJlLUuOPzX
Content-Type: multipart/mixed; boundary="oLgGb4CoOy9gGjPXaoCdhJXJTDo4Hm2Za";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Message-ID: <c28703a4-6936-15f2-730f-c3d96e1326a5@suse.de>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
 <3aac3e39-4889-22dc-83dc-72fff63cb3d0@suse.de>
 <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>
In-Reply-To: <CAKMK7uFyTM9NQzhtOv-ABemYThLE2CnA=OYRiJwe7YwgotfLPA@mail.gmail.com>

--oLgGb4CoOy9gGjPXaoCdhJXJTDo4Hm2Za
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.05.21 um 22:00 schrieb Daniel Vetter:

>> Sharing common code among subsystems is not a problem. Many of our
>> more-sophisticated helpers are located in DRM because no other
>> subsystems have the requirements yet. Maybe AI now has and we can move=

>> the rsp shareable code to a common location. But AI is still no GPU. T=
o
>> give a bad analogy: GPUs transmit audio these days. Yet we don't treat=

>> them as sound cards.
>=20
> We actually do, there are full blown sound drivers for them over in
> sound/ (ok I think they're all in sound/hda for pci gpus or in
> sound/soc actually). There's some glue to tie it together because it
> requires coordination between the gpu and sound side of things, but
> that's it.

I know. But we don't merge both subsystems, just because the devices=20
have some overlap in functionality.

Best regards
Thomas

>=20
> Also I think it would be extremely silly to remove all the drm_ stuff
> just because it's originated from GPUs, and therefore absolutely
> cannot be used by other accelarators. I'm not seeing the point in
> that, but if someone has convincing technical argument for this we
> could do it. A tree wide s/drm_/xpu_ might make some sense perhaps if
> that makes people more comfortable with the idea of reusing code from
> gpu origins for accelerators in general.
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oLgGb4CoOy9gGjPXaoCdhJXJTDo4Hm2Za--

--6jSQ74WCN6fjyYkRQIxlywyhJlLUuOPzX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCizvQFAwAAAAAACgkQlh/E3EQov+Ay
WA/8CsiYmVjdX5mgd24Mcuk72EZyvsLI0bseTUnltOfF9WZPXw+wfSzWJakKqYxGzZ0aFernuz7F
dkhwFKzWJ+ZpD2+WyDaxiaoSXoh4yg2rqRSGOZa0W3r/bq5homk2bAkXOpmnHtOAytVz6UxiHJew
x4Qa9RxqEOud72vSONmfeoyD4Ib9iunpTUAFok43yg9OoxgUlhipSCwbfJRU4V6slHIQuB8yqvHS
uossF7guT0jBrK1YXvwod3ZnEAi+5ilWCEiPejlOD2Z171cu3Ak9/xRevN8Tg8AoL/ki40x6bBgV
V5mQzShY0zGyIQtunneyClthNf5SsBWyIBR1rNxNFAkQcqqxr0U/ShLjEanUW8ET5Po29cusZ4WD
eqkh17gqtQubxwxnxFVyAg0yRY8ruuQBMmUqLxLNbsr8SO0NJa138MXY9AMIDUKdPsVGHOxBxsP1
9xrIpRJCZ/qSFoUaqFdMDjOJ349Ubso6KGIL2YMlkK6j2i56t0IWCE7rqraPNaEiCaJcqp7juprE
ioWCUB1p/8R5hgiCmCvLc6+r/av2ibMlsN6wZLOvZFjLcGjPn+0ZSLIlKUZ1zk+Z73j+HkElJeIM
eBNHSFMwPffAQKItkJ2csc9xTCXWAeLvIG6r2dhvSJLlnI/YyQMDV+09ss7MB6umfEMcmb8dzqZf
Kzk=
=+mZB
-----END PGP SIGNATURE-----

--6jSQ74WCN6fjyYkRQIxlywyhJlLUuOPzX--
