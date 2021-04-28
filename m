Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079136E49C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189F66EC78;
	Thu, 29 Apr 2021 05:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp112.ord1c.emailsrvr.com (smtp112.ord1c.emailsrvr.com
 [108.166.43.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDD16E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:12:19 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp15.relay.ord1c.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 8203320199; 
 Wed, 28 Apr 2021 13:12:17 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 10:12:12 -0700
Message-ID: <8049200.4jvIBUede8@mizzik>
In-Reply-To: <CAOFGe95sNTYu3YSZf7eP16ssz=goMVxtoZx2yKiY9xJMS7A3Ew@mail.gmail.com>
References: <20210426093901.28937-1-matthew.auld@intel.com>
 <bf868000-6a97-ec98-e154-548782a9a865@intel.com>
 <CAOFGe95sNTYu3YSZf7eP16ssz=goMVxtoZx2yKiY9xJMS7A3Ew@mail.gmail.com>
MIME-Version: 1.0
X-Classification-ID: ccb12a51-a55f-46d5-888a-2a59a742c0d9-1-1
X-Mailman-Approved-At: Thu, 29 Apr 2021 05:49:49 +0000
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1546316292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1546316292==
Content-Type: multipart/signed; boundary="nextPart5263843.F5xLCIcnGf"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5263843.F5xLCIcnGf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
To: Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, Jon Bloomfield <jon.bloomfield@intel.com>, Jordan Justen <jordan.l.justen@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, ML mesa-dev <mesa-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 1/9] drm/doc/rfc: i915 DG1 uAPI
Date: Wed, 28 Apr 2021 10:12:12 -0700
Message-ID: <8049200.4jvIBUede8@mizzik>
In-Reply-To: <CAOFGe95sNTYu3YSZf7eP16ssz=goMVxtoZx2yKiY9xJMS7A3Ew@mail.gmail.com>
References: <20210426093901.28937-1-matthew.auld@intel.com> <bf868000-6a97-ec98-e154-548782a9a865@intel.com> <CAOFGe95sNTYu3YSZf7eP16ssz=goMVxtoZx2yKiY9xJMS7A3Ew@mail.gmail.com>

On Wednesday, April 28, 2021 9:56:25 AM PDT Jason Ekstrand wrote:
> On Wed, Apr 28, 2021 at 11:41 AM Matthew Auld <matthew.auld@intel.com> wrote:
[snip]
> > Slightly orthogonal: what does Mesa do here for snooped vs LLC
> > platforms? Does it make such a distinction? Just curious.
> 
> In Vulkan on non-LLC platforms, we only enable snooping for things
> that are going to be mapped: staging buffers, state buffers, batches,
> etc.  For anything that's not mapped (tiled images, etc.) we leave
> snooping off on non-LLC platforms so we don't take a hit from it.  In
> GL, I think it works out to be effectively the same but it's a less
> obvious decision there.
> 
> --Jason

iris currently enables snooping on non-LLC platforms when Gallium marks
a resource as PIPE_USAGE_STAGING, which generally means it's going to be
mapped and "fast CPU access" is desired.  Most buffers are not snooped.

I don't believe i965 uses snooping at all, surprisingly.

--Ken

--nextPart5263843.F5xLCIcnGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmCJl2wACgkQW1vaBx1J
zDhR1A//af0oss4ddalEUbGfV/ijKqW7P0rwnKTXdPHTiGmL7HujWklUSAzIENOu
0wwfEvy42+fOftoDeo9sMMkuChT732rQX6OrwYw766UYwOTWySbKei87te7jLEGQ
EGb/hUYhq99LFq043Oxeuyy4HhXTQEQafNVj8isCk2WNQWbcCZl/gO03LF9iC9Y9
OjU7sYWlWPHkUCBPdcL0o31qiBaunZrJv8RbjVm4Csr+MsI3zRLdzZ0SiUVKFvIn
sIonBFw2JqMSUugWqLKJwqs5z/dVz/xJCVds8/mOic4V2g+d6nP5jkLWUTTNFXkF
jDZSTxrMwkjAj2GxhgBpBQc22wViTlaIi3vVx7KFFba5hF4yrEhkN5msUJoxqQME
DWNFW1H1DjV77lierhsowW5ucZ12DaVSAcubGUp6rUKc5oYFXOZgPVyZksj5sqJs
9vYA72Bb6WYq095vkoZcNSOXr2XqmiGCx7rqVogWLtMhfr0ynPAxHwvwB54F9UJS
ndm9qR6GwNo0mbSF7tZ+042AlPN0W+7dFaegXszj2NQCkrFI7ZzWpEuWOe5spFV4
p0YIw7ec7jQluOmmC3WUYj1eQO+IqmfZpYD76fMkt9WqHpJ2uoONzrKWpDmDvyt3
P/7/xJER+ALIrVU53y75dAKosHC+i3Lq63NjDkGcFhHFVm1+ZDg=
=VfQU
-----END PGP SIGNATURE-----

--nextPart5263843.F5xLCIcnGf--




--===============1546316292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1546316292==--



