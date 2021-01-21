Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D459F2FE6F8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 11:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BBD6E057;
	Thu, 21 Jan 2021 10:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687256E057
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 10:01:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04255AD24;
 Thu, 21 Jan 2021 10:01:13 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
Date: Thu, 21 Jan 2021 11:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0090068815=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0090068815==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mCmSvhEZha19ykyYCf4I0fHCDa1r5PhXD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mCmSvhEZha19ykyYCf4I0fHCDa1r5PhXD
Content-Type: multipart/mixed; boundary="lfTYPP7prtNBzhmOUAvs9rdAVo9vDi3Or";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hudson@trmm.net, markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, peter@stuge.se
Message-ID: <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
In-Reply-To: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>

--lfTYPP7prtNBzhmOUAvs9rdAVo9vDi3Or
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.01.21 um 09:27 schrieb Daniel Vetter:
> On Thu, Jan 21, 2021 at 8:45 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi Noralf,
>>
>> glad to hear from you! Welcome back!
>>
>> Am 20.01.21 um 18:42 schrieb Daniel Vetter:
>>> On Wed, Jan 20, 2021 at 6:10 PM Noralf Tr=C3=B8nnes <noralf@tronnes.o=
rg> wrote:
>>>>
>>>> Add a connector type for USB connected display panels.
>>>>
>>>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>> ---
>>>>    include/uapi/drm/drm_mode.h | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode=
=2Eh
>>>> index fed66a03c7ae..33024cc5d26e 100644
>>>> --- a/include/uapi/drm/drm_mode.h
>>>> +++ b/include/uapi/drm/drm_mode.h
>>>> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
>>>>    #define DRM_MODE_CONNECTOR_DPI         17
>>>>    #define DRM_MODE_CONNECTOR_WRITEBACK   18
>>>>    #define DRM_MODE_CONNECTOR_SPI         19
>>>> +#define DRM_MODE_CONNECTOR_USB         20
>>
>> I would not call it USB. I could imagine that at some point a generic
>> USB protocol could serve simple displays (i.e. in the sense of USB HID=

>> or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB
>> should be reserved for this case.
>=20
> We end up calling those DisplayPort, since that's what's being
> transported over thunderbolt or usb-C. So the usb connector would be
> called usb-C. I think the reason we don't do fancy connector names is
> that adding them is a bit a pain. Plus drm/i915 specifically has some
> very quirky connector enumerating that doesn't match much with reality
> unfortunately anyway :-/

In the case of the other USB drivers, IIRC we use the connector type=20
that is at the output (i.e., HDMI in the case of udl). I think we should =

do the same here. Or use 'Unknown'.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Beware, new connector types have in the past resulted in userspace
>>> burning&crashing. Maybe it's become better ...
>>>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>
>>>>    /**
>>>>     * struct drm_mode_get_connector - Get connector metadata.
>>>> --
>>>> 2.23.0
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lfTYPP7prtNBzhmOUAvs9rdAVo9vDi3Or--

--mCmSvhEZha19ykyYCf4I0fHCDa1r5PhXD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJUOcFAwAAAAAACgkQlh/E3EQov+Be
4BAAp1z0WmiKxITIHfPPs34dBNay9Q/OSTtuHD2m4TbJ/E2lZiZYGa4sp+kWDFRjdN3z7PzKqWxU
sU0jfBMWjOxul7+Td4pjwgvslMlCAaaRExky06f5l5fGgX7ob+LmjG88pbUGd1wie5Xnl6nrXM42
JG5UEMytTUiljRXxcFlqBYvBdrFGt1tF3RM/2VoRKGaVMl9cSsMy63lXiWwMp+XFjCgiucEAuoN3
W+VHNclDAkaUFrtOSa11aDOmNmgo2F+8LtzuZLsNJmAjYudbMsW36mtK3xD/orcXCMQOpEOOzmon
E8t/oUDIRUTMy2ov2/OUXYGre0lTkpWowZSKEg4AMBmhAC4yAXsVZfK47TDw8lWz+M9Hv5bjViMP
+0qEdu2mGsBQ3ONMe/rypi5v/+rMjEjBhZ8+rKlm60Hldr442gauP0KwnRlHrPrnzkEjUDyDcPUJ
uuIdYws8u6SRAsoE848gI6TbyiMT9SfRQn0XnvCQ1T5a6xgxTuDPxfAIL2NBUTwqs1Mkh6bGKp1E
MHPlG0VmhT/38asfsL5ke2ndz4fgNHTopROhs82cknx1A7K65b73WwRz+X03/Ea4yepdvTevDs0A
CxczhYAhW2ZsmlHYIF414MXUMljO103kN06JitpkUZfK5d6ggXa/CcLbhiSuQSyhZuS4VmiI5kJp
wjM=
=oEma
-----END PGP SIGNATURE-----

--mCmSvhEZha19ykyYCf4I0fHCDa1r5PhXD--

--===============0090068815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0090068815==--
