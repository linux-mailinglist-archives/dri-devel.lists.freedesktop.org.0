Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA830063D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 15:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A368189CE1;
	Fri, 22 Jan 2021 14:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE20689CE1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 14:55:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F271AE89;
 Fri, 22 Jan 2021 14:55:36 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
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
 <9168c91b-f97d-5725-7d6f-8c97fb422d9a@suse.de>
 <9422f5f9-1889-f556-7297-202d6fb52433@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d171596d-f967-ee6a-44f1-c06713cf10cb@suse.de>
Date: Fri, 22 Jan 2021 15:55:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9422f5f9-1889-f556-7297-202d6fb52433@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0049879580=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0049879580==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="U15ie7P0eO1UXCEISDaTYtapBh7xKKlDp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U15ie7P0eO1UXCEISDaTYtapBh7xKKlDp
Content-Type: multipart/mixed; boundary="xXiyRVdf8GYocZbXU0ORannGXnhdOOh3Z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tyler Hardin <th020394@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <d171596d-f967-ee6a-44f1-c06713cf10cb@suse.de>
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
 <9168c91b-f97d-5725-7d6f-8c97fb422d9a@suse.de>
 <9422f5f9-1889-f556-7297-202d6fb52433@tronnes.org>
In-Reply-To: <9422f5f9-1889-f556-7297-202d6fb52433@tronnes.org>

--xXiyRVdf8GYocZbXU0ORannGXnhdOOh3Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.21 um 15:35 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 22.01.2021 13.47, skrev Thomas Zimmermann:
>> Hi
>>
>> Am 22.01.21 um 12:44 schrieb Noralf Tr=C3=B8nnes:
>>>
>>> And wrt PCI it wouldn't be a PCI connector if the card has some other=

>>> connector for the display, but if it was possible to connect a displa=
y
>>> directly to the PCI connector, then yes I would call that a PCI
>>> connector.
>>
>> You're not connecting a display to the computer. You're connecting an
>> RPi and then connect the display to the RPi. The RPi acts like an
>> external graphics card.
>>
>>> This begs the question: Why does the kernel provide info to userspace=

>>> about the connector type?
>>>
>>> My take is that it is so the user can know which display is connected=
 to
>>> which port on the computer.
>>
>> This exactly illustrates the problem with the current naming. For a
>> single output the distinction between bus and connector might be fuzzy=
=2E
>> As soon as a connected SoC contains multiple connectors. The user then=

>> sees names such as card1-USB-0 and card1-USB-1, which makes no sense.
>>
>=20
> If you look at the code I pasted in, you'll see that the SoC connector
> types are passed through to the host driver as-is unless they are panel=

> connectors like DSI/DPI, which will be interpreted as USB (the protocol=

> does support multiple connectors, but only one can be used at a time).
>=20
> So for the Pi4 as a display adapter, the host will see card1-HDMI-0 and=

> card1-HDMI-1, the same is true for the composite output (if enabled) it=

> shows up as card1-Composite-0 (can't be enabled together with HDMI).
>=20
> If the Pi4 is used together with a DSI connected touchscreen, it makes
> sense to disable the SoC HDMI outputs and the host only will see the
> board as card1-USB-0 (I haven't done this exercise yet since there's
> problems with getting the official Pi touchscreen to work with vc4 on P=
i4).

I saw that. I can even get your point about using USB for panel (still=20
don't agree). But you're also using USB as default case.

Best regards
Thomas

>=20
> The USB connector type is most important for tiny displays that is
> microcontroller based without Linux running. There are lots of tiny SPI=

> displays and I expect this market to shift towards USB because it much
> easier to connect and the display will be useable on a desktop/server
> computer as status displays perhaps. But embedded will also benefit fro=
m
> having these displays USB interfaced.
>=20
> Another use case I see is repurposing old Android tablets as USB
> displays that can be connected to any computer and become a touchscreen=
=2E
> In this case I also want the connector to be called card1-USB-0 (I
> haven't done any work in this area, old Android is fbdev so some work i=
s
> needed for this to happen).
>=20
> Noralf.
>=20
>>>
>>> What's your opinion?
>>>
>>>>>
>>>>> Ofc as Daniel mentions it's a downside that userspace doesn't know
>>>>> about
>>>>> the connector type, and who knows when it will updated (if I don't =
do
>>>>> it).
>>>>> Weston will name it: "UNNAMED-%d"
>>>>> Mutter: "Unknown%d-%d"
>>>>> X: "Unknown%d-%d"
>>>>>
>>>>> Sam and Laurent has discussed adding a PANEL connector type instead=
 of
>>>>> adding more connector types for panel connectors. I think that woul=
d
>>>>> have been a better choice instead of the SPI connector type that I
>>>>> added
>>>>> in 2019. But I think PANEL was meant for panels connected to an
>>>>> internal
>>>>> connector.
>>>>>
>>>>> Here's my protocol connector types and how it's mapped to DRM:
>>>>>
>>>>> #define GUD_CONNECTOR_TYPE_PANEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0
>>>>> #define GUD_CONNECTOR_TYPE_VGA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>>>>> #define GUD_CONNECTOR_TYPE_COMPOSITE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2
>>>>> #define GUD_CONNECTOR_TYPE_SVIDEO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3
>>>>> #define GUD_CONNECTOR_TYPE_COMPONENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4
>>>>> #define GUD_CONNECTOR_TYPE_DVI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 5
>>>>> #define GUD_CONNECTOR_TYPE_DISPLAYPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 6
>>>>> #define GUD_CONNECTOR_TYPE_HDMI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7
>>>>>
>>>>> static int gud_gadget_ctrl_get_connector(struct gud_gadget *gdg,
>>>>> unsigned int index,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gud_c=
onnector_descriptor_req *desc)
>>>>> {
>>>>> ...
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gconn =3D &gdg->connectors[index];
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (gconn->connector->connector_=
type) {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_VGA:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_VGA;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVII:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVID:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DVIA:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_DVI;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_Composite:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_COMPOSITE;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_SVIDEO:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_SVIDEO;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_Component:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_COMPONENT;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_DisplayPort:=

>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_DISPLAYPORT;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_HDMIA:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fallthrough;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DRM_MODE_CONNECTOR_HDMIB:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_HDMI;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 desc->connector_t=
ype =3D GUD_CONNECTOR_TYPE_PANEL;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>>>>
>>>>>
>>>>> int gud_connector_create(struct gud_device *gdrm, unsigned int inde=
x)
>>>>> {
>>>>> ...
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (desc.connector_type) {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_PANEL:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_USB;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_VGA:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_VGA;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_DVI:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_DVID;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_COMPOSITE:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_Composite;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_SVIDEO:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_SVIDEO;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_COMPONENT:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_Component;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_DISPLAYPORT:=

>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_DisplayPort;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case GUD_CONNECTOR_TYPE_HDMI:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_HDMIA;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default: /* future types */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connector_type =3D=
 DRM_MODE_CONNECTOR_USB;
>>>>
>>>> The more I look at it the more I think it should be 'Unknown' here.
>>>>
>>>
>>> I don't understand this, how will that be better for the user?
>>
>> As I said before, the display is not connected via USB. The RPi (i.e.,=

>> graphics card) is. The naming would be off.
>>
>> Best regards
>> Thomas
>>
>>>
>>>> BTW, can I try this out somehow? I do have an RPi3. Do I need a spec=
ial
>>>> disk image?
>>>
>>> The Pi3 doesn'have a USB device/otg connector so I haven't made an im=
age
>>> for that one. Only the Pi Zero, model A and Pi 4 have that.
>>>
>>> The Pi2 and Pi3 have a USB hub on the soc's single USB port.
>>>
>>> Noralf.
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>>>>
>>>>> Noralf.
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>> -Daniel
>>>>>>>
>>>>>>>>
>>>>>>>> Best regards
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Beware, new connector types have in the past resulted in usersp=
ace
>>>>>>>>> burning&crashing. Maybe it's become better ...
>>>>>>>>>
>>>>>>>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>>>>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 /**
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * struct drm_mode_get_connecto=
r - Get connector metadata.
>>>>>>>>>> --=20
>>>>>>>>>> 2.23.0
>>>>>>>>>>
>>>>>>>>>> _______________________________________________
>>>>>>>>>> dri-devel mailing list
>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> --=20
>>>>>>>> Thomas Zimmermann
>>>>>>>> Graphics Driver Developer
>>>>>>>> SUSE Software Solutions Germany GmbH
>>>>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>>
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


--xXiyRVdf8GYocZbXU0ORannGXnhdOOh3Z--

--U15ie7P0eO1UXCEISDaTYtapBh7xKKlDp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAK52cFAwAAAAAACgkQlh/E3EQov+At
Qg/+INfbIwCo2S4zsWcVKxUzNBNacypuoxkqbYgWdTSDBHqTjSbTwNxqF+ONpADXm3PolHNllM2q
49yVcWqn1Zzqjg17QX4FfutRkllM/spIIwb2gcB0bZ7Kv1msKJyy0SadzkPwuWjMqf2+lma03fS6
I+60AvPnEmwhap6hYd1C3D136cZO83UsteB4lS5na+A51N+xTsunXl7th6Yo+KSmeG94wkqnRqwl
qWmRRLIbLcJNGpkPPnvrHTfmDzqLZAs7kHqMxmGVhBPVV4i1xiv4COC1Wk3APPTNW+ImRkWeKZHY
N//RqNPQYl68zrDxQIZOq9fjPPkijVsfvBjLmz12vu9Ewn/EbPcK8a+lhsqmo03Wq/MAIdQXmyWs
ITfUJHXTxYA5UsCWetxFPbu7CtnA6cR0tl141AgiG5AbM9PtU9xVW5uoThLl5W9k7Qq/8jPIZds3
xlJ99I5bJ898MHbcQN11otm+7z/MfA5iSKwGgNK+yxuQk0of/m1pKvL+L+JC2w8vwa2XDf+9WWTQ
98lpp48QrDvsRti3xd/+AEj5sS7D5sWj6RfOYEb4IIH5wHbO52kpPqP3PqlboUSEDEuwK2gRdCuW
Zqf6/Q/RGNn8bH2WHBsJH+KKjR75ol9CHlpV2rr1IGjL2uBgIPq6+/989PfVqFskEZrZ9NAV7wAi
dy4=
=KNcW
-----END PGP SIGNATURE-----

--U15ie7P0eO1UXCEISDaTYtapBh7xKKlDp--

--===============0049879580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0049879580==--
