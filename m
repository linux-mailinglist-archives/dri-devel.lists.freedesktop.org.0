Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF58380944
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 14:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA386EE60;
	Fri, 14 May 2021 12:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A246EE5E;
 Fri, 14 May 2021 12:14:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98BCAABB1;
 Fri, 14 May 2021 12:14:56 +0000 (UTC)
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
 <20210430082321.3bd9c4a5@canb.auug.org.au>
 <20210514115307.4364aff9@canb.auug.org.au>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d88cedea-1f6c-de70-de56-083e0a378671@suse.de>
Date: Fri, 14 May 2021 14:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514115307.4364aff9@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT"
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT
Content-Type: multipart/mixed; boundary="9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <d88cedea-1f6c-de70-de56-083e0a378671@suse.de>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
 <20210430082321.3bd9c4a5@canb.auug.org.au>
 <20210514115307.4364aff9@canb.auug.org.au>
In-Reply-To: <20210514115307.4364aff9@canb.auug.org.au>

--9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.21 um 03:53 schrieb Stephen Rothwell:
> Hi all,
>=20
> On Fri, 30 Apr 2021 08:23:21 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> On Thu, 18 Mar 2021 12:52:41 +1100 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>>
>>> On Wed, 17 Mar 2021 14:08:24 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>>>
>>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>>
>>>>    drivers/gpu/drm/i915/display/intel_sprite.c
>>>>
>>>> between commit:
>>>>
>>>>    92f1d09ca4ed ("drm: Switch to %p4cc format modifier")
>>>>
>>>> from the drm tree and commit:
>>>>
>>>>    46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")
>>>>
>>>> from the drm-intel tree.
>>>>
>>>> I fixed it up (I used the latter version of the file and applied the=

>>>> following patch) and can carry the fix as necessary. This is now fix=
ed
>>>> as far as linux-next is concerned, but any non trivial conflicts sho=
uld
>>>> be mentioned to your upstream maintainer when your tree is submitted=20
for
>>>> merging.  You may also want to consider cooperating with the maintai=
ner
>>>> of the conflicting tree to minimise any particularly complex conflic=
ts.
>>>>
>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Date: Wed, 17 Mar 2021 14:05:42 +1100
>>>> Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier=
"
>>>>
>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> ---
>>>>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
>>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/dr=
ivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index 1f335cb09149..45ceff436bf7 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> @@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct int=
el_crtc_state *crtc_state,
>>>>   	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
>>>>   	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>>>>   	unsigned int rotation =3D plane_state->hw.rotation;
>>>> -	struct drm_format_name_buf format_name;
>>>>  =20
>>>>   	if (!fb)
>>>>   		return 0;
>>>> @@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct int=
el_crtc_state *crtc_state,
>>>>   		case DRM_FORMAT_XVYU12_16161616:
>>>>   		case DRM_FORMAT_XVYU16161616:
>>>>   			drm_dbg_kms(&dev_priv->drm,
>>>> -				    "Unsupported pixel format %s for 90/270!\n",
>>>> -				    drm_get_format_name(fb->format->format,
>>>> -							&format_name));
>>>> +				    "Unsupported pixel format %p4cc for 90/270!\n",
>>>> +				    &fb->format->format);
>>>>   			return -EINVAL;
>>>>   		default:
>>>>   			break;
>>>> --=20
>>>> 2.30.0
>>>
>>> The above fix up patch now needs to be applied to the drm tree.
>>
>> I am still applying the above patch, but it applies to Linus' tree now=
=2E
>=20
> I am going to stop applying this.  You guys can apply it if you want to=

> some time.
>=20

Sorry, this got lost several times. I've applied your patch to=20
drm-misc-next now. Thanks a lot.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV--

--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCeab4FAwAAAAAACgkQlh/E3EQov+Bf
sw/+LGkhDniEytcmToHBkr0NcCH9ebNFXjGxQPa7SMQsZjZnxFkDjPMLCM6Jc0B7rjV1pXpRAeTt
i7y8b0P0sHhzAd5y8Yxr6Ad/MoQ2dZaieAng09ZlHTXZhtNw+NoUjUaGFSybYIbwdmCCg6jvxc0+
zozFGONubkZH2VLoQ4s+6i/EyEU52jVje7GpJ2XXCWTT7jk5x1Pmy3Nb4zfWJNzgg9UMSASJxQPk
sgI1ilitPNbEt9yY+UnlS1sXMGYpPSGY4JlY8KcucxdKUduyFT2MoIBVbccF2ghmGx97yLNjFWPa
FZ6XIm47jp8QoQZT53dpQSyZCXqIISNDG0DD04gdYfUsds0YszSPx2SoJqIuisL5d0aQ7TemRuOr
SWJUvlluZYjBILcrcaHYb3+NWLZjcBMr4V4XyHKZfH8clLOX9NWbmWQjDK9E1tNyedwDytEsx1KP
7ulvdZ6QVUijIPsOhpMh2FgJPJQ4sQHhp4EQiGo7pS5CVth9cgpS97yrjtsIiZ0tTRBoKWybw/Ut
qeSvnLicAnW6zq/diqLK2OmM1GFpyzWVsmPQYtSS5vbXJhXjibu96yMFAavTDOSeK5WPLhG2m7Gq
Camt/HzLJd9NwAvUKZz7+7d/Av1dt/iGA4UU/xoXc7DpETfqtPuFjC2mWJgrJgQIO3rBpsqgwej3
f6w=
=ev6h
-----END PGP SIGNATURE-----

--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT--
