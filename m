Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA5221C30
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 07:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F7F6E29B;
	Thu, 16 Jul 2020 05:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05B46E29B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:55:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB3C9B6F7;
 Thu, 16 Jul 2020 05:55:09 +0000 (UTC)
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
 <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>
Message-ID: <dec4e5cf-f309-4695-6362-200ca663ff71@suse.de>
Date: Thu, 16 Jul 2020 07:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0949948874=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0949948874==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EOHx2xuLdEtKHz4VlgVU8lnnpzpzQ6Oyy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EOHx2xuLdEtKHz4VlgVU8lnnpzpzQ6Oyy
Content-Type: multipart/mixed; boundary="YDFZHVgLQglipeZZ8Lcqabi40b5XFvEUg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <dec4e5cf-f309-4695-6362-200ca663ff71@suse.de>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
 <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>
In-Reply-To: <e88a2b2d-185c-fef4-6928-446e1ac0c95c@suse.de>

--YDFZHVgLQglipeZZ8Lcqabi40b5XFvEUg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 16.07.20 um 07:44 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 15.07.20 um 21:56 schrieb Dave Airlie:
>> On Thu, 16 Jul 2020 at 00:59, Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>>
>>> This patchset puts device initialization in the correct order and
>>> adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).
>>
>> why? :-)
>=20
> With G200 support in place, we can add also support for the newer cards=

> in the G-Series up to the G550. Believe it or not, the G550 for PCIe is=

> still being actively marketed and manufactured by Matrox. [1] Even the
> predecessor chips G450 was only EOLed in Oct 2016. [2] So while the
> chips might be 20yrs old, the devices are still current.
>=20
> Best regards
> Thomas
>=20
> [1]
> https://matrox.com/graphics/en/products/graphics_cards/g_series/g550pci=
e/?productTabs=3D1
> [2] https://www.matrox.com/graphics/en/products/legacy/g_series/g450pci=
/
>=20
>>
>> I'm pretty sure I NAKed the previous version because the userspace
>> experience for these old cards was probably better with
>> xorg-x11-drv-mga, but hey maybe it isn't anymore and we should go
>> ahead. I know SuSE use these for testing, but apart from that do we
>> really think we have any users for this?

Well, I got at least one email from someone thanking me for this patch. :=
)

>>
>> Dave.
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
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


--YDFZHVgLQglipeZZ8Lcqabi40b5XFvEUg--

--EOHx2xuLdEtKHz4VlgVU8lnnpzpzQ6Oyy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8P67kUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMooQf+LGMFGMSKHh03rKqx2kr9vHqRrnYY
IaU0TnJySv0oou0/CXNfZYPSUhxEGkVyk+0i+A25sNP0CutSzGIh1R4bGK2Spihv
b1doF//Y1CyjEJ64dXJmYoJ+JwRiHqxGXMKCyZ/koOrQm9Vj2CwyfYGw3F7DZPds
p3V3YVpyVF+pU+nBJMsWg4ArXU11pvIxcw/0MCF4K1BdJWLkEN9GEvJLw4mNJdBu
9/a2gtn3gDrxEcNiyyLCS6iBrFRmSlpjr1z3fq9SfT3DQVaQvt5tMZwpGTBsDgCd
cFMEHqZLxOabezvbCZwIlX/5fIrzKF2Hj6Ue7txNfknYxb27n2LugNs17g==
=3VGf
-----END PGP SIGNATURE-----

--EOHx2xuLdEtKHz4VlgVU8lnnpzpzQ6Oyy--

--===============0949948874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0949948874==--
