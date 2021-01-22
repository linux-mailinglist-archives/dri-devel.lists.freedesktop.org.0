Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECB30036E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 13:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5B96E965;
	Fri, 22 Jan 2021 12:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45656E9DE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 12:47:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35EF2B27B;
 Fri, 22 Jan 2021 12:47:53 +0000 (UTC)
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
 <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
Message-ID: <9168c91b-f97d-5725-7d6f-8c97fb422d9a@suse.de>
Date: Fri, 22 Jan 2021 13:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0250875396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0250875396==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sj246xE2lb1bQXlfoLKzvZDURk6zdWrnk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sj246xE2lb1bQXlfoLKzvZDURk6zdWrnk
Content-Type: multipart/mixed; boundary="DaHSbkc7wG81XN6JUouFFoVL4cOMMGEAW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: hudson@trmm.net, markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, peter@stuge.se
Message-ID: <9168c91b-f97d-5725-7d6f-8c97fb422d9a@suse.de>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
 <1ea4e6e4-0806-dba1-a424-47f178dc882f@suse.de>
 <7f055c8e-4b60-3da5-058e-3991637db37a@tronnes.org>
 <a1de51bf-b602-9ac2-1058-b8ced7c6973e@suse.de>
 <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>
In-Reply-To: <dfd02473-f0b5-e8b2-3399-d87063a2fd1f@tronnes.org>

--DaHSbkc7wG81XN6JUouFFoVL4cOMMGEAW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.21 um 12:44 schrieb Noralf Tr=C3=B8nnes:
>=20
> And wrt PCI it wouldn't be a PCI connector if the card has some other
> connector for the display, but if it was possible to connect a display
> directly to the PCI connector, then yes I would call that a PCI connect=
or.

You're not connecting a display to the computer. You're connecting an=20
RPi and then connect the display to the RPi. The RPi acts like an=20
external graphics card.

> This begs the question: Why does the kernel provide info to userspace
> about the connector type?
>=20
> My take is that it is so the user can know which display is connected t=
o
> which port on the computer.

This exactly illustrates the problem with the current naming. For a=20
single output the distinction between bus and connector might be fuzzy.=20
As soon as a connected SoC contains multiple connectors. The user then=20
sees names such as card1-USB-0 and card1-USB-1, which makes no sense.

>=20
> What's your opinion?
>=20
>>>
>>> Ofc as Daniel mentions it's a downside that userspace doesn't know ab=
out
>>> the connector type, and who knows when it will updated (if I don't do=

>>> it).
>>> Weston will name it: "UNNAMED-%d"
>>> Mutter: "Unknown%d-%d"
>>> X: "Unknown%d-%d"
>>>
>>> Sam and Laurent has discussed adding a PANEL connector type instead o=
f
>>> adding more connector types for panel connectors. I think that would
>>> have been a better choice instead of the SPI connector type that I ad=
ded
>>> in 2019. But I think PANEL was meant for panels connected to an inter=
nal
>>> connector.
>>>
>>> Here's my protocol connector types and how it's mapped to DRM:
>>>
>>> #define GUD_CONNECTOR_TYPE_PANEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0
>>> #define GUD_CONNECTOR_TYPE_VGA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>>> #define GUD_CONNECTOR_TYPE_COMPOSITE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2
>>> #define GUD_CONNECTOR_TYPE_SVIDEO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3
>>> #define GUD_CONNECTOR_TYPE_COMPONENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4
>>> #define GUD_CONNECTOR_TYPE_DVI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 5
>>> #define GUD_CONNECTOR_TYPE_DISPLAYPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 6
>>> #define GUD_CONNECTOR_TYPE_HDMI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 7
>>>
>>> static int gud_gadget_ctrl_get_connector(struct gud_gadget *gdg,
>>> unsigned int index,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gud_connector_=
descriptor_req *desc)
>>> {
>>> ...
>>>  =C2=A0=C2=A0=C2=A0=C2=A0gconn =3D &gdg->connectors[index];
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0switch (gconn->connector->connector_type) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_VGA:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_VGA;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVII:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVID:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVIA:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_DVI;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_Composite:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_COMPOSITE;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_SVIDEO:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_SVIDEO;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_Component:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_COMPONENT;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DisplayPort:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_DISPLAYPORT;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_HDMIA:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_HDMIB:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_HDMI;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0default:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_type =3D =
GUD_CONNECTOR_TYPE_PANEL;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0};
>>>
>>>
>>> int gud_connector_create(struct gud_device *gdrm, unsigned int index)=

>>> {
>>> ...
>>>  =C2=A0=C2=A0=C2=A0=C2=A0switch (desc.connector_type) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_PANEL:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_USB;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_VGA:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_VGA;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_DVI:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_DVID;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_COMPOSITE:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_Composite;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_SVIDEO:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_SVIDEO;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_COMPONENT:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_Component;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_DISPLAYPORT:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_DisplayPort;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_HDMI:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_HDMIA;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0default: /* future types */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D DRM_MO=
DE_CONNECTOR_USB;
>>
>> The more I look at it the more I think it should be 'Unknown' here.
>>
>=20
> I don't understand this, how will that be better for the user?

As I said before, the display is not connected via USB. The RPi (i.e.,=20
graphics card) is. The naming would be off.

Best regards
Thomas

>=20
>> BTW, can I try this out somehow? I do have an RPi3. Do I need a specia=
l
>> disk image?
>=20
> The Pi3 doesn'have a USB device/otg connector so I haven't made an imag=
e
> for that one. Only the Pi Zero, model A and Pi 4 have that.
>=20
> The Pi2 and Pi3 have a USB hub on the soc's single USB port.
>=20
> Noralf.
>=20
>>
>> Best regards
>> Thomas
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0};
>>>
>>> Noralf.
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> -Daniel
>>>>>
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>>
>>>>>>> Beware, new connector types have in the past resulted in userspac=
e
>>>>>>> burning&crashing. Maybe it's become better ...
>>>>>>>
>>>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0 /**
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 * struct drm_mode_get_connector - Get =
connector metadata.
>>>>>>>> --=20
>>>>>>>> 2.23.0
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> dri-devel mailing list
>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --=20
>>>>>> Thomas Zimmermann
>>>>>> Graphics Driver Developer
>>>>>> SUSE Software Solutions Germany GmbH
>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DaHSbkc7wG81XN6JUouFFoVL4cOMMGEAW--

--sj246xE2lb1bQXlfoLKzvZDURk6zdWrnk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAKyXcFAwAAAAAACgkQlh/E3EQov+AE
ew/9GA5nNtG/Gjnr+8boxdSoo/S8kE+LsxUw8Yw2IwoF+YqBSRRWWl0tPrHmvcLAtfSbzD2Ez9OC
uDyN4jRvNbBgYx0rkI0c2eykUjBcc98fBT2cnjBeaapfGm82BBVesKaLU1AAal40z/1k4haUZgfg
7nSD70vYmrXjJHJz2Krxlb27iqrWhaXPlBcD9jwmPiZ+hE3WMbbMKO3lnvf8HCdWy9Mo9fhm1h4H
ylqfEUKnNh1sxgzfNYcVbvGKWFuaG0x9/F9aPhW1HCH+8Q2WsuU5LFhnMhIsiV0lBEJELyxr2PEh
vt6amZ4i44kzhxGyZuTxDbqwbwE31Y9ZEHRolEPyoekKI1qL1PF3+OkVT/BB56iaTifnOZXI8MWC
GcLU+Wp1hAZU7j8xxWNfzDpxzNMdpTfQw92QDfcbmC7Sqq4oasTYuHw8yYnGLHbN24udfbau+Qg5
ukqOyb82qHlZyvQtGgu16sEqric4G+8aI5vKp7D0FcutNgPdB9RZqLcAfnr5TcvBVYBQPBt5LJuu
saK/iG87HIbj7tgKHU55vMK1/Ius0t7mAc68Zohs82mfaLz32edgdtykA2JsrsJp593Ws6P+5gWA
w/AHOsIapRITYLcwU7/9wu5q5W+fJIfUkJy5Iq65IX0I3Tv7RKw+GZe2awMu9NiEz2wTjEmr1nBC
f0k=
=jgUt
-----END PGP SIGNATURE-----

--sj246xE2lb1bQXlfoLKzvZDURk6zdWrnk--

--===============0250875396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0250875396==--
