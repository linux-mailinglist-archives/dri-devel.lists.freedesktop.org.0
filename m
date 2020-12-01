Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F72CA41C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 14:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622EB6E5A2;
	Tue,  1 Dec 2020 13:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752866E52F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:44:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6615AC2D;
 Tue,  1 Dec 2020 13:44:07 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
 <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
 <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5093b12f-11e8-0cf0-d9e7-7ec9b52e364d@suse.de>
Date: Tue, 1 Dec 2020 14:44:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0469087483=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0469087483==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A4JPUPC7NesAo488BDQKmbXWShmK6qMf9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A4JPUPC7NesAo488BDQKmbXWShmK6qMf9
Content-Type: multipart/mixed; boundary="TI2mo2uPX0PHY1EBfv7CKBJPTTwpazYgl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <5093b12f-11e8-0cf0-d9e7-7ec9b52e364d@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
 <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
 <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>
In-Reply-To: <51e7e774-6795-8eeb-6701-b1cccc4c6199@huawei.com>

--TI2mo2uPX0PHY1EBfv7CKBJPTTwpazYgl
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 14:05 schrieb tiantao (H):
>=20
>=20
> =E5=9C=A8 2020/12/1 20:36, Thomas Zimmermann =E5=86=99=E9=81=93:
>> Hi
>>
>> Am 01.12.20 um 13:26 schrieb tiantao (H):
>>>
>>>
>>> =E5=9C=A8 2020/12/1 20:17, Thomas Zimmermann =E5=86=99=E9=81=93:
>>>> Hi
>>>>
>>>> Am 01.12.20 um 12:55 schrieb Tian Tao:
>>>>> Assign local variable to struct drm_device *dev because they are
>>>>> used multiple times within a function.
>>>>>
>>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>>> ---
>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0=C2=A0 |=
=C2=A0 2 +-
>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=C2=A0 | 30=20
>>>>> ++++++++++++------------
>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=C2=A0 |=C2=A0=
 2 +-
>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |=C2=A0 2 +=
-
>>>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 8 ++++---
>>>>> =C2=A0 5 files changed, 23 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=20
>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>> index ea962ac..096eea9 100644
>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>>>> @@ -499,7 +499,7 @@ static const struct drm_crtc_helper_funcs=20
>>>>> hibmc_crtc_helper_funcs =3D {
>>>>> =C2=A0 int hibmc_de_init(struct hibmc_drm_private *priv)
>>>>> =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc *crtc =3D &priv->crt=
c;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane *plane =3D &priv->p=
rimary_plane;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=20
>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>> index d845657..dd9fadc 100644
>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>>> @@ -79,31 +79,32 @@ static const struct dev_pm_ops hibmc_pm_ops =3D=
 {
>>>>> =C2=A0 static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>>>> =C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>> -=C2=A0=C2=A0=C2=A0 drm_mode_config_init(priv->dev);
>>>>> +=C2=A0=C2=A0=C2=A0 drm_mode_config_init(dev);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_config_initialized =3D tr=
ue;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_width =3D 0;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_height =3D 0;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_width =3D 1920;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_height =3D 1200;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_width =3D 0;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_height =3D 0;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_width =3D 1920;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_height =3D 1200;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.fb_base =3D priv->fb_bas=
e;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.preferred_depth =3D 32;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.prefer_shadow =3D 1;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.fb_base =3D priv->fb_base;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_depth =3D 32;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.funcs =3D (void *)&hibmc=
_mode_funcs;
>>>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.funcs =3D (void *)&hibmc_mode_=
funcs;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_de_init(priv);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "fai=
led to init de: %d\n", ret);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed to=
 init de: %d\n", ret);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_vdac_init(priv);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "fai=
led to init vdac: %d\n", ret);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed to=
 init vdac: %d\n", ret);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> @@ -113,7 +114,7 @@ static int hibmc_kms_init(struct=20
>>>>> hibmc_drm_private *priv)
>>>>> =C2=A0 static void hibmc_kms_fini(struct hibmc_drm_private *priv)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv->mode_config_initialized) {=

>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_cleanup=
(priv->dev);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_cleanup=
(&priv->dev);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_c=
onfig_initialized =3D false;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0 }
>>>>> @@ -202,7 +203,7 @@ static void hibmc_hw_config(struct=20
>>>>> hibmc_drm_private *priv)
>>>>> =C2=A0 static int hibmc_hw_map(struct hibmc_drm_private *priv)
>>>>> =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev =3D dev->pdev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t addr, size, ioaddr, =
iosize;
>>>>> @@ -258,7 +259,7 @@ static int hibmc_unload(struct drm_device *dev)=

>>>>> =C2=A0 static int hibmc_load(struct drm_device *dev)
>>>>> =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv;
>>>>> +=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv =3D to_hibmc_drm=
_private(dev);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv =3D drmm_kzalloc(dev, sizeof(*p=
riv), GFP_KERNEL);
>>>>> @@ -267,7 +268,6 @@ static int hibmc_load(struct drm_device *dev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOM=
EM;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->dev_private =3D priv;
>>>>> -=C2=A0=C2=A0=C2=A0 priv->dev =3D dev;
>>>>
>>>> I'm sure this either does not build or does not work. There's a call=
=20
>>>> to drm_dev_alloc(), which initialized the DRM device. You need to=20
>>>> assign the returned device here. The embedding of dev only work=20
>>>> after you switched to devm_drm_dev_alloc() in the next patch.
>>>>
>>>> For the patch at hand, just keep struct hibmc_drm_private.dev as a=20
>>>> pointer and you should be fine.
>>>>
>>> Changing drm_device *dev to drm_device dev and using=20
>>> devm_drm_dev_alloc does not easily split into two patches.
>>> The patch does not compile well on its own, but it will compile fine =

>>> with patch #2.
>>> Can patch #1 and patch #2 be combined into a single patch,just like V=
1.
>>
>> Most of the code in this patch does
>>
>> =C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>
>> to get dev as a local variable. Why don't you do
>>
>> =C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>
>> ?
>>
>> That's all that's really needed.
>=20
> +=C2=A0=C2=A0=C2=A0 priv =3D devm_drm_dev_alloc(&pdev->dev, &hibmc_driv=
er,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private, dev);
> devm_drm_dev_alloc function requires parameter 4, dev must be a=20
> non-pointer for it to work. so had to change dev in the=20
> hibmc_drm_private=C2=A0 to non-pointer.
> This is also the reason to change drm_device *dev to drm_device dev.

Yes, but that's what patch 2 is about. Patch 1 is about simplifying=20
these pointer dereferences into local variables. For this, all you need i=
s

	struct drm_device *dev =3D priv->dev;

In patch 2, these lines are then changed to

	struct drm_device *dev =3D &priv->dev;

That makes 2 self-contained patches.

Best regards
Thomas

>>
>> Best regards
>> Thomas
>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_hw_init(priv);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=20
>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>> index f310a83..e35353a 100644
>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>>>> @@ -37,7 +37,7 @@ struct hibmc_drm_private {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t=C2=A0 fb_size;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* drm */
>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device=C2=A0 *dev;
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane primary_plane;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc crtc;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder encoder;
>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c=20
>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>> index 74e26c2..d35548d 100644
>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>>>> @@ -96,7 +96,7 @@ static const struct drm_encoder_funcs=20
>>>>> hibmc_encoder_funcs =3D {
>>>>> =C2=A0 int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>>>> =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_connector *hibmc_connec=
tor =3D &priv->connector;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder =3D &pri=
v->encoder;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector =3D =
&hibmc_connector->base;
>>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=20
>>>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>> index 602ece1..e84fb81 100644
>>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>>>> @@ -25,7 +25,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc=
)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_vram_mm *vmm;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D hibmc->dev;
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmm =3D drm_vram_helper_alloc_mm(dev=
,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pci_resource_start(dev->pdev, 0),
>>>>> @@ -41,10 +41,12 @@ int hibmc_mm_init(struct hibmc_drm_private *hib=
mc)
>>>>> =C2=A0 void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>>>>> =C2=A0 {
>>>>> -=C2=A0=C2=A0=C2=A0 if (!hibmc->dev->vram_mm)
>>>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!dev->vram_mm)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>> -=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(hibmc->dev);
>>>>> +=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(dev);
>>>>> =C2=A0 }
>>>>> =C2=A0 int hibmc_dumb_create(struct drm_file *file, struct drm_devi=
ce *dev,
>>>>>
>>>>
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TI2mo2uPX0PHY1EBfv7CKBJPTTwpazYgl--

--A4JPUPC7NesAo488BDQKmbXWShmK6qMf9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GSKYFAwAAAAAACgkQlh/E3EQov+A/
7w/+MRbsojh58a4/R8mSEk7k0fZFE8GLEx5oO0zZ0Omdvlly7kddTHqvM9/cqtKOJT1Ft6T0oLvJ
4VaUJfL2f516p40F26Jji6Yj8Fl87nX32QBOr1SGvdDhAG1YL7kwpt47VOsjv5SoC9RjeUemnPq2
pkD49nr5JAWDe621TDU+1PKx/fQJS9NXSTUwlDg167wXZiLn2KaqgLDhby9wEbplZTYV426oNfaq
vS5CpDsb9vnRzj1cF1ibw6lA1u/4Z6MRvzNkXYUXYH0iIqqD3qMar1455rkIktA/dn9siqB1iQXJ
4zEpqnnLGeXtC6+UE6wEtiVWhxB9h3uos4Ns+PYhUVHste7DqyrSAhudAXqjAkTfwkheyLzfX+8t
y/Jbp6Pz1w0gyVScTmEPFdCfmRq7VGdVh2kBbhNAXXfUr4r6cKLKBJPp9AK73QQcH/mo4PdN6CPL
zaYONr5pv/DM4oXIpoGYI3/CCM6cEkTW9vbeGfcl0AXdbqZraR2owOjkevDz8aKJTr7WwsW2bpJb
eq6SoKv0j+orpmrRJKa087z56qr3KVSJtF2ecrC7UmObjjPAZYLeQnTNJ1YuJCm/zVF/wHQTaiXV
FguSPrZWMZ9h/3+Sk9ZrL5L/KvrpKA5vz093nlo8yNm6cVgi+ghonH0OE72tTocCT3xfdVr0vnLP
ngM=
=qjoA
-----END PGP SIGNATURE-----

--A4JPUPC7NesAo488BDQKmbXWShmK6qMf9--

--===============0469087483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0469087483==--
