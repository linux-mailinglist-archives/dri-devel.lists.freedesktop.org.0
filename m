Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BE2FFDA5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 08:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD2F6E215;
	Fri, 22 Jan 2021 07:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88606E215
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:54:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 448A6AC45;
 Fri, 22 Jan 2021 07:54:36 +0000 (UTC)
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
Message-ID: <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
Date: Fri, 22 Jan 2021 08:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0552568672=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0552568672==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="epu1D3JI0uBYzAXZ989g1Lya8WJzESvC3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--epu1D3JI0uBYzAXZ989g1Lya8WJzESvC3
Content-Type: multipart/mixed; boundary="nri1PVPucg8bDytObE1K9mkd3ByRXcvQZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: hudson@trmm.net, markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, peter@stuge.se
Message-ID: <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
In-Reply-To: <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>

--nri1PVPucg8bDytObE1K9mkd3ByRXcvQZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.01.21 um 19:07 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 21.01.2021 11.01, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 21.01.21 um 09:27 schrieb Daniel Vetter:
>>> On Thu, Jan 21, 2021 at 8:45 AM Thomas Zimmermann
>>> <tzimmermann@suse.de> wrote:
>>>>
>>>> Hi Noralf,
>>>>
>>>> glad to hear from you! Welcome back!
>=20
> Thanks Thomas!
>=20
>>>>
>>>> Am 20.01.21 um 18:42 schrieb Daniel Vetter:
>>>>> On Wed, Jan 20, 2021 at 6:10 PM Noralf Tr=C3=B8nnes <noralf@tronnes=
=2Eorg>
>>>>> wrote:
>>>>>>
>>>>>> Add a connector type for USB connected display panels.
>>>>>>
>>>>>> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>>>> ---
>=20
> I have forgotten to update drm_connector_enum_list which maps type to n=
ame.
>=20
>>>>>>  =C2=A0=C2=A0 include/uapi/drm/drm_mode.h | 1 +
>>>>>>  =C2=A0=C2=A0 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mo=
de.h
>>>>>> index fed66a03c7ae..33024cc5d26e 100644
>>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>>> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
>>>>>>  =C2=A0=C2=A0 #define DRM_MODE_CONNECTOR_DPI=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 17
>>>>>>  =C2=A0=C2=A0 #define DRM_MODE_CONNECTOR_WRITEBACK=C2=A0=C2=A0 18
>>>>>>  =C2=A0=C2=A0 #define DRM_MODE_CONNECTOR_SPI=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 19
>>>>>> +#define DRM_MODE_CONNECTOR_USB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 20
>>>>
>>>> I would not call it USB. I could imagine that at some point a generi=
c
>>>> USB protocol could serve simple displays (i.e. in the sense of USB H=
ID
>>>> or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB=

>>>> should be reserved for this case.
>>>
>>> We end up calling those DisplayPort, since that's what's being
>>> transported over thunderbolt or usb-C. So the usb connector would be
>>> called usb-C. I think the reason we don't do fancy connector names is=

>>> that adding them is a bit a pain. Plus drm/i915 specifically has some=

>>> very quirky connector enumerating that doesn't match much with realit=
y
>>> unfortunately anyway :-/
>>
>> In the case of the other USB drivers, IIRC we use the connector type
>> that is at the output (i.e., HDMI in the case of udl). I think we shou=
ld
>> do the same here. Or use 'Unknown'.
>>
>=20
> There are 2 DRM USB drivers and they use:
> - udl: DRM_MODE_CONNECTOR_DVII

Mine has plain old VGA. Maybe we should change generally this to Unknown.=


> - gm12u320: DRM_MODE_CONNECTOR_VGA
>=20
> gm12u320 is a mini projector so it doesn't actually have a VGA
> connector. I have never seen a udl device but I assume it has a DVII
> connector?
>=20
> For display adapters it makes sense to use the connector on the adapter=

> as the reported connector, but for display panels that don't have any
> connector except for the cable that is connected to the hosts USB
> connector, why can't it be called a USB connector? That's the connector=

> the user sees.

It's not the relevant connector for the display output. USB is the bus=20
system. (Making your argument in terms of discrete GPUs, the connector=20
would always be PCI then.)

>=20
> Ofc as Daniel mentions it's a downside that userspace doesn't know abou=
t
> the connector type, and who knows when it will updated (if I don't do i=
t).
> Weston will name it: "UNNAMED-%d"
> Mutter: "Unknown%d-%d"
> X: "Unknown%d-%d"
>=20
> Sam and Laurent has discussed adding a PANEL connector type instead of
> adding more connector types for panel connectors. I think that would
> have been a better choice instead of the SPI connector type that I adde=
d
> in 2019. But I think PANEL was meant for panels connected to an interna=
l
> connector.
>=20
> Here's my protocol connector types and how it's mapped to DRM:
>=20
> #define GUD_CONNECTOR_TYPE_PANEL		0
> #define GUD_CONNECTOR_TYPE_VGA			1
> #define GUD_CONNECTOR_TYPE_COMPOSITE		2
> #define GUD_CONNECTOR_TYPE_SVIDEO		3
> #define GUD_CONNECTOR_TYPE_COMPONENT		4
> #define GUD_CONNECTOR_TYPE_DVI			5
> #define GUD_CONNECTOR_TYPE_DISPLAYPORT		6
> #define GUD_CONNECTOR_TYPE_HDMI			7
>=20
> static int gud_gadget_ctrl_get_connector(struct gud_gadget *gdg,
> unsigned int index,
> 					 struct gud_connector_descriptor_req *desc)
> {
> ...
> 	gconn =3D &gdg->connectors[index];
>=20
> 	switch (gconn->connector->connector_type) {
> 	case DRM_MODE_CONNECTOR_VGA:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_VGA;
> 		break;
> 	case DRM_MODE_CONNECTOR_DVII:
> 		fallthrough;
> 	case DRM_MODE_CONNECTOR_DVID:
> 		fallthrough;
> 	case DRM_MODE_CONNECTOR_DVIA:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_DVI;
> 		break;
> 	case DRM_MODE_CONNECTOR_Composite:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_COMPOSITE;
> 		break;
> 	case DRM_MODE_CONNECTOR_SVIDEO:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_SVIDEO;
> 		break;
> 	case DRM_MODE_CONNECTOR_Component:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_COMPONENT;
> 		break;
> 	case DRM_MODE_CONNECTOR_DisplayPort:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_DISPLAYPORT;
> 		break;
> 	case DRM_MODE_CONNECTOR_HDMIA:
> 		fallthrough;
> 	case DRM_MODE_CONNECTOR_HDMIB:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_HDMI;
> 		break;
> 	default:
> 		desc->connector_type =3D GUD_CONNECTOR_TYPE_PANEL;
> 		break;
> 	};
>=20
>=20
> int gud_connector_create(struct gud_device *gdrm, unsigned int index)
> {
> ...
> 	switch (desc.connector_type) {
> 	case GUD_CONNECTOR_TYPE_PANEL:
> 		connector_type =3D DRM_MODE_CONNECTOR_USB;
> 		break;
> 	case GUD_CONNECTOR_TYPE_VGA:
> 		connector_type =3D DRM_MODE_CONNECTOR_VGA;
> 		break;
> 	case GUD_CONNECTOR_TYPE_DVI:
> 		connector_type =3D DRM_MODE_CONNECTOR_DVID;
> 		break;
> 	case GUD_CONNECTOR_TYPE_COMPOSITE:
> 		connector_type =3D DRM_MODE_CONNECTOR_Composite;
> 		break;
> 	case GUD_CONNECTOR_TYPE_SVIDEO:
> 		connector_type =3D DRM_MODE_CONNECTOR_SVIDEO;
> 		break;
> 	case GUD_CONNECTOR_TYPE_COMPONENT:
> 		connector_type =3D DRM_MODE_CONNECTOR_Component;
> 		break;
> 	case GUD_CONNECTOR_TYPE_DISPLAYPORT:
> 		connector_type =3D DRM_MODE_CONNECTOR_DisplayPort;
> 		break;
> 	case GUD_CONNECTOR_TYPE_HDMI:
> 		connector_type =3D DRM_MODE_CONNECTOR_HDMIA;
> 		break;
> 	default: /* future types */
> 		connector_type =3D DRM_MODE_CONNECTOR_USB;

The more I look at it the more I think it should be 'Unknown' here.

BTW, can I try this out somehow? I do have an RPi3. Do I need a special=20
disk image?

Best regards
Thomas

> 		break;
> 	};
>=20
> Noralf.
>=20
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Beware, new connector types have in the past resulted in userspace
>>>>> burning&crashing. Maybe it's become better ...
>>>>>
>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>
>>>>>>  =C2=A0=C2=A0 /**
>>>>>>  =C2=A0=C2=A0=C2=A0 * struct drm_mode_get_connector - Get connecto=
r metadata.
>>>>>> --=20
>>>>>> 2.23.0
>>>>>>
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>>>
>>>>>
>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>
>>>
>>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
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


--nri1PVPucg8bDytObE1K9mkd3ByRXcvQZ--

--epu1D3JI0uBYzAXZ989g1Lya8WJzESvC3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAKhLoFAwAAAAAACgkQlh/E3EQov+A5
7xAAqhWBr/COD3T4aBC2D1ZsrWNEWJbhIWcxqCE2mualwimrYR6Rr77CeZhE3dcdRIZdqUYNZjFI
mw/nJgx+CcObAfZitEsPqZBLMmkHGrJPUMDH9H6hP296b+aY7E9lzKfHw6CR+yWt1Rm9JnQLPQvn
pRMUzNoputmDTjibuXrBQWHTSioqbcCJkdJkNHA6J70V8gdN79KX9bb85do7eUie+IP1D1CNNXHY
7YUEcp2B5K4AYY6p6y37jtx9gR+C/QTRAa6ZVJjKOioOk2nVWDBSqzIk5gD/nETiHxF3krwuQW/k
CNwtAZ5x13LKNKeF9JwekK1pOAUx2V63NlZMK+ySQezW72W4jCMZsLmI9i0SfaFYc4w8UZ32EcEm
2GPc9f4kQKpVxQUqJPQbwBqrNqLQ42bb2WphatZrtxn8fa9R89p55YIPpBnxdi4ydMEpwvU77tRc
HJm8X7rJK8CAiOLnjiap25MnVXJvpJjnOZWhzakf0RCsYGvh8TfCkk8QwTjO3+n8mLvJtIXmUfTl
SFe8Wyh3Ogz72yBP+GS3I9+HXAKFuG0+xvK+v+77gfT7jOU9K2IWgSjKeeO8HKyt+tQ/ROJ1rLvz
rsSLNX5n6ZSBcZ2y9Tbc2ucY07ndNjHwtJX0mprprIxdf5s/aruF+XkOadc4inbFg246o7msQ0sO
FQQ=
=OFct
-----END PGP SIGNATURE-----

--epu1D3JI0uBYzAXZ989g1Lya8WJzESvC3--

--===============0552568672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0552568672==--
