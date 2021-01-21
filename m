Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AE2FE442
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 08:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C301C89B78;
	Thu, 21 Jan 2021 07:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1642C89B78
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:45:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93542AD29;
 Thu, 21 Jan 2021 07:45:22 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
Message-ID: <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
Date: Thu, 21 Jan 2021 08:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: multipart/mixed; boundary="===============0877808683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0877808683==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9j87slOnp5dXVR7mVMi6q4gWaKLdJY8uk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9j87slOnp5dXVR7mVMi6q4gWaKLdJY8uk
Content-Type: multipart/mixed; boundary="gWfJxreA5R6PCSYL0yNv5ravgbAmv9EO5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>

--gWfJxreA5R6PCSYL0yNv5ravgbAmv9EO5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

glad to hear from you! Welcome back!

Am 20.01.21 um 18:42 schrieb Daniel Vetter:
> On Wed, Jan 20, 2021 at 6:10 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org=
> wrote:
>>
>> Add a connector type for USB connected display panels.
>>
>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>> ---
>>   include/uapi/drm/drm_mode.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h=

>> index fed66a03c7ae..33024cc5d26e 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
>>   #define DRM_MODE_CONNECTOR_DPI         17
>>   #define DRM_MODE_CONNECTOR_WRITEBACK   18
>>   #define DRM_MODE_CONNECTOR_SPI         19
>> +#define DRM_MODE_CONNECTOR_USB         20

I would not call it USB. I could imagine that at some point a generic=20
USB protocol could serve simple displays (i.e. in the sense of USB HID=20
or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB=20
should be reserved for this case.

Best regards
Thomas

>=20
> Beware, new connector types have in the past resulted in userspace
> burning&crashing. Maybe it's become better ...
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>   /**
>>    * struct drm_mode_get_connector - Get connector metadata.
>> --
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--gWfJxreA5R6PCSYL0yNv5ravgbAmv9EO5--

--9j87slOnp5dXVR7mVMi6q4gWaKLdJY8uk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJMREFAwAAAAAACgkQlh/E3EQov+Ai
6RAAjAxmkSjaOON+hMbC8MwFq9UXDtyJg7ZbUl6iDRdGWAZKCFSTEi/XKc/j8BsLs5SfVgHZ6P1E
6G0Bs5sYNiGsqxom37cZKOzDzDRAj/fPlsJ7f/bqn71kIwctZIrbGGJWgY6a2EOX+W8Kabb4WiOj
lHOPCydgHlE+aJfFAz+MNT2Z/CV8CrCxyWO6fdsmMwxZjoHi3adlY/NPgZCYbkBrPuspYs6LT0Da
X3u/wMCj48RpXjYhquMmHXSO0XkHqSLv3Nr/VDSlS499Y757Ib+y3kHEqGCt+Bqz4SMrgS52GJxB
dxmON+V2oDKGmdwW9BT8VQZYmHR+3a5kcD4tmdvALI70oCQHw8gCrnlrgJJDkSBwppJR8wVguagm
v/VcJXUzKa7W0JhUvwvHoqBCdtChanBF1rqVEa6q3XiYBs4TaCTO6gLJYgj+DEyHFFuWJc7yYsSn
DDCPk0Ymvj/U1DFuyPWKaWaR/W8fy0bKW9ODObTy1r1v4Fd1iKZ1sN95aprRxui3otAPbjbi1Vqd
e2E1u8deXgoWBgGhqQmYRUEmD5KInX5MmolY6x2AtB+5Wr/bK3LaXasq60reADuxrl+/KF5T9pLf
q1IyoH/jLm1mqsfVG1p8mxc+ScLpLTRVgJeDkAZTvSgU0h28926HAiFOpl8QmdlxRdvKwE2Zsat4
1/8=
=rS5O
-----END PGP SIGNATURE-----

--9j87slOnp5dXVR7mVMi6q4gWaKLdJY8uk--

--===============0877808683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0877808683==--
